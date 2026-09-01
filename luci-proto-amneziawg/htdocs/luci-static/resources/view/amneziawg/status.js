'use strict';
'require view';
'require rpc';
'require poll';
'require dom';
'require ui';


var callGetAwgInstances = rpc.declare({
	object: 'luci.amneziawg',
	method: 'getAwgInstances'
});

function ensureStylesheet() {
	if (document.querySelector('link[data-amneziawg-styles]'))
		return;

	document.head.appendChild(E('link', {
		'rel': 'stylesheet',
		'href': L.resource('amneziawg.css'),
		'data-amneziawg-styles': ''
	}));
}

function formatBytes(value) {
	return '%1024mB'.format(+value || 0);
}

function shortenKey(value) {
	value = String(value || '');
	return value.length > 15 ? value.substring(0, 7) + '…' + value.substring(value.length - 7) : value;
}

function timestampToRelative(timestamp) {
	if (timestamp < 1)
		return _('Never', 'No AmneziaWG peer handshake yet');

	var seconds = Math.max(0, Math.floor((Date.now() / 1000) - timestamp));

	if (seconds < 60)
		return _('%ds ago').format(seconds);
	else if (seconds < 3600)
		return _('%dm ago').format(Math.floor(seconds / 60));
	else if (seconds < 86400)
		return _('%dh ago').format(Math.floor(seconds / 3600));

	return _('%dd ago').format(Math.floor(seconds / 86400));
}

function timestampToExact(timestamp) {
	return timestamp > 0 ? new Date(timestamp * 1000).toLocaleString() : _('No handshake recorded');
}

function handshakeState(timestamp) {
	if (timestamp < 1)
		return {
			'className': 'awg-status-never',
			'label': _('Never connected'),
			'description': _('No handshake recorded')
		};

	var age = (Date.now() / 1000) - timestamp;

	if (age <= 180)
		return {
			'className': 'awg-status-recent',
			'label': _('Recent handshake'),
			'description': _('A recent handshake was recorded. This does not continuously test connectivity.')
		};

	return {
		'className': 'awg-status-stale',
		'label': _('No recent handshake'),
		'description': _('The last handshake is older than three minutes. An idle peer may still be configured correctly.')
	};
}

function fallbackCopy(value) {
	return new Promise(function(resolve, reject) {
		var input = E('textarea', {
			'style': 'position:fixed;left:-9999px;top:-9999px',
			'readonly': ''
		}, [ value ]);

		document.body.appendChild(input);
		input.select();

		try {
			if (document.execCommand('copy'))
				resolve();
			else
				reject(new Error('copy command failed'));
		}
		catch (error) {
			reject(error);
		}
		finally {
			document.body.removeChild(input);
		}
	});
}

function copyValue(value) {
	if (navigator.clipboard && navigator.clipboard.writeText)
		return navigator.clipboard.writeText(value).catch(function() {
			return fallbackCopy(value);
		});

	return fallbackCopy(value);
}

function copyButton(value, label) {
	return E('button', {
		'class': 'btn cbi-button awg-copy-button',
		'type': 'button',
		'disabled': value ? null : '',
		'click': function(ev) {
			var button = ev.currentTarget,
			    original = button.textContent;

			return copyValue(String(value || '')).then(function() {
				button.textContent = _('Copied');
				window.setTimeout(function() { button.textContent = original; }, 1500);
			}, function() {
				ui.addNotification(null, E('p', [ _('Unable to copy the value.') ]), 'error');
			});
		}
	}, [ label || _('Copy') ]);
}

function handleInterfaceDetails(iface) {
	ui.showModal(_('Instance Details'), [
		ui.itemlist(E([]), [
			_('Name'), iface.name,
			_('Public Key'), E('div', { 'class': 'awg-copy-value' }, [
				E('code', { 'class': 'awg-break-all' }, [ iface.public_key || _('none') ]),
				copyButton(iface.public_key, _('Copy'))
			]),
			_('Listen Port'), iface.listen_port,
			_('Firewall Mark'), iface.fwmark != 'off' ? iface.fwmark : E('em', _('none')),
			_('Random Trailers'), iface.random_trailers == 'on' ? _('enabled') : _('disabled'),
			_('Cookie Replies'), iface.disable_cookies == 'on' ? _('disabled') : _('enabled')
		]),
		E('div', { 'class': 'right' }, [
			E('button', {
				'class': 'btn cbi-button',
				'click': ui.hideModal
			}, [ _('Dismiss') ])
		])
	]);
}

function handlePeerDetails(peer) {
	ui.showModal(_('Peer Details'), [
		ui.itemlist(E([]), [
			_('Description'), peer.name || E('em', [ _('Untitled peer') ]),
			_('Public Key'), E('div', { 'class': 'awg-copy-value' }, [
				E('code', { 'class': 'awg-break-all' }, [ peer.public_key || _('none') ]),
				copyButton(peer.public_key, _('Copy'))
			]),
			_('Endpoint'), E('div', { 'class': 'awg-copy-value' }, [
				E('span', { 'class': 'awg-break-all' }, [ peer.endpoint || _('none') ]),
				copyButton(peer.endpoint && peer.endpoint != '(none)' ? peer.endpoint : '', _('Copy'))
			]),
			_('Allowed IPs'), (Array.isArray(peer.allowed_ips) && peer.allowed_ips.length) ? peer.allowed_ips.join(', ') : E('em', _('none')),
			_('Received Data'), formatBytes(peer.transfer_rx),
			_('Transmitted Data'), formatBytes(peer.transfer_tx),
			_('Latest Handshake'), timestampToExact(+peer.latest_handshake) + ' (' + timestampToRelative(+peer.latest_handshake) + ')',
			_('Keep-Alive'), (peer.persistent_keepalive != 'off') ? _('every %s', 'AmneziaWG keep alive interval').format(peer.persistent_keepalive) : E('em', _('none'))
		]),
		E('div', { 'class': 'right' }, [
			E('button', {
				'class': 'btn cbi-button',
				'click': ui.hideModal
			}, [ _('Dismiss') ])
		])
	]);
}

function renderHandshake(peer) {
	var timestamp = +peer.latest_handshake,
	    state = handshakeState(timestamp);

	return E('div', { 'class': 'awg-handshake' }, [
		E('span', {
			'class': 'awg-status-pill ' + state.className,
			'title': state.description
		}, [
			E('span', { 'class': 'awg-status-dot', 'aria-hidden': 'true' }),
			state.label
		]),
		E('span', {
			'class': 'awg-handshake-time',
			'title': timestampToExact(timestamp)
		}, [ timestampToRelative(timestamp) ])
	]);
}

function renderPeerList(instanceName, peers) {
	if (!peers.length)
		return E('div', { 'class': 'awg-empty awg-empty-compact' }, [
			E('strong', [ _('No peers connected') ]),
			E('span', [ _('Configured peers will appear here when the interface reports them.') ])
		]);

	return E('div', {
		'class': 'awg-peer-table',
		'id': 'peers-' + instanceName,
		'role': 'table',
		'aria-label': _('AmneziaWG peers')
	}, [
		E('div', { 'class': 'awg-peer-row awg-peer-head', 'role': 'row' }, [
			E('span', { 'role': 'columnheader' }, [ _('Peer') ]),
			E('span', { 'role': 'columnheader' }, [ _('Endpoint') ]),
			E('span', { 'role': 'columnheader' }, [ _('Traffic') ]),
			E('span', { 'role': 'columnheader' }, [ _('Latest Handshake') ]),
			E('span', { 'role': 'columnheader' }, [ _('Actions') ])
		])
	].concat(peers.map(function(peer) {
			var endpoint = (peer.endpoint && peer.endpoint != '(none)') ? peer.endpoint : _('Not available');

			return E('div', { 'class': 'awg-peer-row', 'role': 'row' }, [
				E('div', { 'class': 'awg-peer-identity', 'role': 'cell' }, [
					E('strong', [ peer.name || E('em', [ _('Untitled peer') ]) ]),
					E('code', {
						'class': 'awg-key-short',
						'title': _('Public key: %h', 'Tooltip displaying full AmneziaWG peer public key').format(peer.public_key)
					}, [ shortenKey(peer.public_key) ])
				]),
				E('div', { 'class': 'awg-peer-endpoint', 'role': 'cell', 'data-label': _('Endpoint') }, [ endpoint ]),
				E('div', { 'class': 'awg-peer-traffic', 'role': 'cell', 'data-label': _('Traffic') }, [
					E('span', { 'title': _('Received Data') }, [ '↓ ', formatBytes(peer.transfer_rx) ]),
					E('span', { 'title': _('Transmitted Data') }, [ '↑ ', formatBytes(peer.transfer_tx) ])
				]),
				E('div', { 'role': 'cell', 'data-label': _('Latest Handshake') }, [ renderHandshake(peer) ]),
				E('div', { 'class': 'awg-peer-actions', 'role': 'cell' }, [
					E('button', {
						'class': 'btn cbi-button',
						'type': 'button',
						'click': function() { handlePeerDetails(peer); }
					}, [ _('Details') ])
				])
			]);
		}))
	);
}

function renderInterface(instanceName, iface) {
	var peers = Array.isArray(iface.peers) ? iface.peers : [],
	    received = 0,
	    transmitted = 0;

	peers.forEach(function(peer) {
		received += +peer.transfer_rx || 0;
		transmitted += +peer.transfer_tx || 0;
	});

	return E('section', { 'class': 'awg-interface-card' }, [
		E('div', { 'class': 'awg-interface-header' }, [
			E('div', { 'class': 'awg-interface-title' }, [
				E('img', { 'src': L.resource('icons', 'amneziawg.svg'), 'alt': '' }),
				E('div', [
					E('h3', [ instanceName ]),
					E('span', { 'class': 'awg-status-pill awg-status-recent' }, [
						E('span', { 'class': 'awg-status-dot', 'aria-hidden': 'true' }),
						_('Interface is running')
					])
				])
			]),
			E('button', {
				'class': 'btn cbi-button',
				'type': 'button',
				'click': function() { handleInterfaceDetails(iface); }
			}, [ _('Interface details') ])
		]),
		E('div', { 'class': 'awg-interface-summary' }, [
			E('div', [ E('span', [ _('Listen Port') ]), E('strong', [ String(iface.listen_port || '—') ]) ]),
			E('div', [ E('span', [ _('Peers') ]), E('strong', [ String(peers.length) ]) ]),
			E('div', [ E('span', [ _('Received Data') ]), E('strong', [ formatBytes(received) ]) ]),
			E('div', [ E('span', [ _('Transmitted Data') ]), E('strong', [ formatBytes(transmitted) ]) ]),
			E('div', { 'class': 'awg-summary-key' }, [
				E('span', [ _('Public Key') ]),
				E('strong', { 'title': iface.public_key || '' }, [ shortenKey(iface.public_key) ]),
				copyButton(iface.public_key, _('Copy'))
			])
		]),
		renderPeerList(instanceName, peers)
	]);
}

return view.extend({
	renderIfaces: function(ifaces) {
		var names = Object.keys(ifaces || {}),
		    content = [
			E('div', { 'class': 'awg-page-heading' }, [
				E('div', [
					E('h2', [ _('AmneziaWG Status') ]),
					E('p', [ _('Handshake and traffic information reported by running AmneziaWG interfaces.') ])
				]),
				E('span', { 'class': 'awg-interface-count' }, [ _('%d interface(s)').format(names.length) ])
			])
		];

		if (!names.length) {
			content.push(E('div', { 'class': 'awg-empty' }, [
				E('img', { 'src': L.resource('icons', 'amneziawg.svg'), 'alt': '' }),
				E('h3', [ _('No AmneziaWG interfaces configured.') ]),
				E('p', [ _('Create an AmneziaWG interface or start an existing one to see its status here.') ]),
				E('a', {
					'class': 'btn cbi-button cbi-button-positive',
					'href': L.url('admin/network/network')
				}, [ _('Open network interfaces') ])
			]));
		}
		else {
			names.forEach(function(instanceName) {
				content.push(renderInterface(instanceName, ifaces[instanceName]));
			});
		}

		return E('div', { 'class': 'awg-status-page' }, content);
	},

	renderError: function(error) {
		return E('div', { 'class': 'awg-status-page' }, [
			E('h2', [ _('AmneziaWG Status') ]),
			E('div', { 'class': 'alert-message error awg-status-error' }, [
				E('strong', [ _('Unable to load AmneziaWG status.') ]),
				E('p', [ _('The page will retry automatically.') ]),
				error && error.message ? E('code', [ error.message ]) : ''
			])
		]);
	},

	refresh: function() {
		return callGetAwgInstances().then(L.bind(function(ifaces) {
			dom.content(document.querySelector('#view'), this.renderIfaces(ifaces));
		}, this), L.bind(function(error) {
			dom.content(document.querySelector('#view'), this.renderError(error));
		}, this));
	},

	render: function() {
		ensureStylesheet();
		poll.add(L.bind(this.refresh, this), 5);

		return E('div', { 'class': 'awg-status-page' }, [
			E('h2', [ _('AmneziaWG Status') ]),
			E('div', { 'class': 'awg-loading' }, [
				E('span', { 'class': 'spinning' }),
				E('span', [ _('Loading data…') ])
			])
		]);
	},

	handleReset: null,
	handleSaveApply: null,
	handleSave: null
});
