'use strict';
'require fs';
'require ui';
'require dom';
'require uci';
'require rpc';
'require form';
'require network';
'require validation';
'require uqr';

var generateKey = rpc.declare({
	object: 'luci.amneziawg',
	method: 'generateKeyPair',
	expect: { keys: {} }
});

var getPublicAndPrivateKeyFromPrivate = rpc.declare({
	object: 'luci.amneziawg',
	method: 'getPublicAndPrivateKeyFromPrivate',
	params: ['privkey'],
	expect: { keys: {} }
});

var generatePsk = rpc.declare({
	object: 'luci.amneziawg',
	method: 'generatePsk',
	expect: { psk: '' }
});

var qrIcon = '<svg viewBox="0 0 29 29" xmlns="http://www.w3.org/2000/svg"><path fill="#fff" d="M0 0h29v29H0z"/><path d="M4 4h1v1H4zM5 4h1v1H5zM6 4h1v1H6zM7 4h1v1H7zM8 4h1v1H8zM9 4h1v1H9zM10 4h1v1h-1zM12 4h1v1h-1zM13 4h1v1h-1zM14 4h1v1h-1zM15 4h1v1h-1zM16 4h1v1h-1zM18 4h1v1h-1zM19 4h1v1h-1zM20 4h1v1h-1zM21 4h1v1h-1zM22 4h1v1h-1zM23 4h1v1h-1zM24 4h1v1h-1zM4 5h1v1H4zM10 5h1v1h-1zM12 5h1v1h-1zM14 5h1v1h-1zM16 5h1v1h-1zM18 5h1v1h-1zM24 5h1v1h-1zM4 6h1v1H4zM6 6h1v1H6zM7 6h1v1H7zM8 6h1v1H8zM10 6h1v1h-1zM12 6h1v1h-1zM18 6h1v1h-1zM20 6h1v1h-1zM21 6h1v1h-1zM22 6h1v1h-1zM24 6h1v1h-1zM4 7h1v1H4zM6 7h1v1H6zM7 7h1v1H7zM8 7h1v1H8zM10 7h1v1h-1zM12 7h1v1h-1zM13 7h1v1h-1zM14 7h1v1h-1zM15 7h1v1h-1zM18 7h1v1h-1zM20 7h1v1h-1zM21 7h1v1h-1zM22 7h1v1h-1zM24 7h1v1h-1zM4 8h1v1H4zM6 8h1v1H6zM7 8h1v1H7zM8 8h1v1H8zM10 8h1v1h-1zM16 8h1v1h-1zM18 8h1v1h-1zM20 8h1v1h-1zM21 8h1v1h-1zM22 8h1v1h-1zM24 8h1v1h-1zM4 9h1v1H4zM10 9h1v1h-1zM12 9h1v1h-1zM13 9h1v1h-1zM15 9h1v1h-1zM18 9h1v1h-1zM24 9h1v1h-1zM4 10h1v1H4zM5 10h1v1H5zM6 10h1v1H6zM7 10h1v1H7zM8 10h1v1H8zM9 10h1v1H9zM10 10h1v1h-1zM12 10h1v1h-1zM14 10h1v1h-1zM16 10h1v1h-1zM18 10h1v1h-1zM19 10h1v1h-1zM20 10h1v1h-1zM21 10h1v1h-1zM22 10h1v1h-1zM23 10h1v1h-1zM24 10h1v1h-1zM13 11h1v1h-1zM14 11h1v1h-1zM15 11h1v1h-1zM16 11h1v1h-1zM4 12h1v1H4zM5 12h1v1H5zM8 12h1v1H8zM9 12h1v1H9zM10 12h1v1h-1zM13 12h1v1h-1zM15 12h1v1h-1zM19 12h1v1h-1zM21 12h1v1h-1zM22 12h1v1h-1zM23 12h1v1h-1zM24 12h1v1h-1zM5 13h1v1H5zM6 13h1v1H6zM8 13h1v1H8zM11 13h1v1h-1zM13 13h1v1h-1zM14 13h1v1h-1zM15 13h1v1h-1zM16 13h1v1h-1zM19 13h1v1h-1zM22 13h1v1h-1zM4 14h1v1H4zM5 14h1v1H5zM9 14h1v1H9zM10 14h1v1h-1zM11 14h1v1h-1zM15 14h1v1h-1zM18 14h1v1h-1zM19 14h1v1h-1zM20 14h1v1h-1zM21 14h1v1h-1zM22 14h1v1h-1zM23 14h1v1h-1zM7 15h1v1H7zM8 15h1v1H8zM9 15h1v1H9zM11 15h1v1h-1zM12 15h1v1h-1zM13 15h1v1h-1zM17 15h1v1h-1zM18 15h1v1h-1zM20 15h1v1h-1zM21 15h1v1h-1zM23 15h1v1h-1zM4 16h1v1H4zM6 16h1v1H6zM10 16h1v1h-1zM11 16h1v1h-1zM13 16h1v1h-1zM14 16h1v1h-1zM16 16h1v1h-1zM17 16h1v1h-1zM18 16h1v1h-1zM22 16h1v1h-1zM23 16h1v1h-1zM24 16h1v1h-1zM12 17h1v1h-1zM16 17h1v1h-1zM17 17h1v1h-1zM18 17h1v1h-1zM4 18h1v1H4zM5 18h1v1H5zM6 18h1v1H6zM7 18h1v1H7zM8 18h1v1H8zM9 18h1v1H9zM10 18h1v1h-1zM14 18h1v1h-1zM16 18h1v1h-1zM17 18h1v1h-1zM21 18h1v1h-1zM22 18h1v1h-1zM23 18h1v1h-1zM4 19h1v1H4zM10 19h1v1h-1zM12 19h1v1h-1zM13 19h1v1h-1zM15 19h1v1h-1zM16 19h1v1h-1zM19 19h1v1h-1zM21 19h1v1h-1zM23 19h1v1h-1zM24 19h1v1h-1zM4 20h1v1H4zM6 20h1v1H6zM7 20h1v1H7zM8 20h1v1H8zM10 20h1v1h-1zM12 20h1v1h-1zM13 20h1v1h-1zM15 20h1v1h-1zM18 20h1v1h-1zM19 20h1v1h-1zM20 20h1v1h-1zM22 20h1v1h-1zM23 20h1v1h-1zM24 20h1v1h-1zM4 21h1v1H4zM6 21h1v1H6zM7 21h1v1H7zM8 21h1v1H8zM10 21h1v1h-1zM13 21h1v1h-1zM15 21h1v1h-1zM16 21h1v1h-1zM19 21h1v1h-1zM21 21h1v1h-1zM23 21h1v1h-1zM24 21h1v1h-1zM4 22h1v1H4zM6 22h1v1H6zM7 22h1v1H7zM8 22h1v1H8zM10 22h1v1h-1zM13 22h1v1h-1zM15 22h1v1h-1zM18 22h1v1h-1zM19 22h1v1h-1zM20 22h1v1h-1zM21 22h1v1h-1zM22 22h1v1h-1zM4 23h1v1H4zM10 23h1v1h-1zM12 23h1v1h-1zM13 23h1v1h-1zM14 23h1v1h-1zM17 23h1v1h-1zM18 23h1v1h-1zM20 23h1v1h-1zM22 23h1v1h-1zM4 24h1v1H4zM5 24h1v1H5zM6 24h1v1H6zM7 24h1v1H7zM8 24h1v1H8zM9 24h1v1H9zM10 24h1v1h-1zM12 24h1v1h-1zM13 24h1v1h-1zM14 24h1v1h-1zM16 24h1v1h-1zM17 24h1v1h-1zM18 24h1v1h-1zM22 24h1v1h-1zM24 24h1v1h-1z"/></svg>';

function ensureStylesheet() {
	if (document.querySelector('link[data-amneziawg-styles]'))
		return;

	document.head.appendChild(E('link', {
		'rel': 'stylesheet',
		'href': L.resource('amneziawg.css'),
		'data-amneziawg-styles': ''
	}));
}

function validateBase64(section_id, value) {
	if (value.length == 0)
		return true;

	if (value.length != 44 || !value.match(/^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$/))
		return _('Invalid Base64 key string');

	if (value[43] != "=" )
		return _('Invalid Base64 key string');

	return true;
}

function validateUnsignedIntegerRange(section_id, value, max) {
	if (value == null || value.length == 0)
		return true;

	var match = value.match(/^(\d+)(?:-(\d+))?$/);
	if (!match)
		return _('Expected a number or an ascending range (for example 15-30)');

	var lower = Number(match[1]),
	    upper = Number(match[2] || match[1]);

	if (!Number.isSafeInteger(lower) || !Number.isSafeInteger(upper) ||
	    lower > upper || upper > max)
		return _('Range values must be between 0 and %d').format(max);

	return true;
}

function validateUint16Range(section_id, value) {
	return validateUnsignedIntegerRange(section_id, value, 65535);
}

function validateUint32Range(section_id, value) {
	return validateUnsignedIntegerRange(section_id, value, 4294967295);
}

function validateAwgBoolean(section_id, value) {
	if (value == null || value.length == 0)
		return true;

	if (!value.match(/^(?:on|off|\d+)$/i))
		return _('Expected "on", "off", or a non-negative integer');

	return true;
}

function awgBooleanToFlag(value) {
	var normalized = String(value == null ? '' : value).toLowerCase();

	return (normalized == 'on' || normalized.match(/^\d*[1-9]\d*$/)) ? '1' : '0';
}

function awgBooleanToConfig(value) {
	return awgBooleanToFlag(value) == '1' ? 'on' : 'off';
}

var stubValidator = {
	factory: validation,
	apply: function(type, value, args) {
		if (value != null)
			this.value = value;

		return validation.types[type].apply(this, args);
	},
	assert: function(condition) {
		return !!condition;
	}
};

function generateDescription(name, texts) {
	return E('li', { 'style': 'color: inherit;' }, [
		E('span', name),
		E('ul', texts.map(function (text) {
			return E('li', { 'style': 'color: inherit;' }, text);
		}))
	]);
}

var cbiSettingGroup = form.DummyValue.extend({
	renderWidget: function() {
		return E('div', { 'class': 'awg-setting-group' }, [
			E('h4', [ this.groupTitle ]),
			this.groupDescription ? E('p', [ this.groupDescription ]) : ''
		]);
	}
});

function addSettingGroup(section, tab, option, title, description) {
	var group = section.taboption(tab, cbiSettingGroup, option, ' ');
	group.groupTitle = title;
	group.groupDescription = description;
	return group;
}

function buildSVGQRCode(data, code) {
	// pixel size 3 for mobile browser
	const options = {
		pixelSize: 3,
		whiteColor: 'white',
		blackColor: 'black'
	};

	try {
		const svg = uqr.renderSVG(data, options);
		code.style.opacity = '';
		dom.content(code, Object.assign(E(svg), {
			style: 'width:100%;height:auto'
		}));
	}
	catch (e) {
		console.warn('QR generation failed:', e);

		code.style.opacity = '';
		dom.content(code, E('div', {
			'class': 'alert-message warning',
			'style': 'margin:0;text-align:center'
		}, [
			_('QR code generation failed. The configuration may be too large.')
		]));
	}
}

function fallbackCopyText(value) {
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

function copyText(value) {
	if (navigator.clipboard && navigator.clipboard.writeText)
		return navigator.clipboard.writeText(value).catch(function() {
			return fallbackCopyText(value);
		});

	return fallbackCopyText(value);
}

function downloadText(value, filename) {
	var blob = new Blob([ value ], { type: 'text/plain;charset=utf-8' }),
	    url = URL.createObjectURL(blob),
	    link = E('a', { 'href': url, 'download': filename });

	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
	window.setTimeout(function() { URL.revokeObjectURL(url); }, 0);
}

var cbiKeyPairGenerate = form.DummyValue.extend({
	cfgvalue: function(section_id, value) {
		return E('button', {
			'class': 'btn',
			'click': ui.createHandlerFn(this, function(section_id, ev) {
				var prv = this.section.getUIElement(section_id, 'private_key'),
				    pub = this.section.getUIElement(section_id, 'public_key'),
				    map = this.map;

				return generateKey().then(function(keypair) {
					prv.setValue(keypair.priv);
					pub.setValue(keypair.pub);
					map.save(null, true);
				});
			}, section_id)
		}, [ _('Generate new key pair') ]);
	}
});

function handleWindowDragDropIgnore(ev) {
	ev.preventDefault()
}

return network.registerProtocol('amneziawg', {
	getI18n: function() {
		return _('AmneziaWG VPN');
	},

	getIfname: function() {
		return this._ubus('l3_device') || this.sid;
	},

	getPackageName: function() {
		return 'amneziawg-tools';
	},

	isFloating: function() {
		return true;
	},

	isVirtual: function() {
		return true;
	},

	getDevices: function() {
		return null;
	},

	containsDevice: function(ifname) {
		return (network.getIfnameOf(ifname) == this.getIfname());
	},

	renderFormOptions: function(s) {
		var o, ss, ss2;
		ensureStylesheet();

		// -- general ---------------------------------------------------------------------

		o = s.taboption('general', form.Value, 'private_key', _('Private Key'), _('Required. Base64-encoded private key for this interface.'));
		o.password = true;
		o.validate = validateBase64;
		o.rmempty = false;

		var serverName = this.getIfname();

		o = s.taboption('general', form.Value, 'public_key', _('Public Key'), _('Base64-encoded public key of this interface for sharing.'));
		o.rmempty = false;
		o.write = function() {/* write nothing */};

		o.load = function(section_id) {
			var privKey = s.formvalue(section_id, 'private_key') || uci.get('network', section_id, 'private_key');

			return getPublicAndPrivateKeyFromPrivate(privKey).then(
				function(keypair) {
					return keypair.pub || '';
				},
				function(error) {
					return _('Error getting PublicKey');
			}, this)
		};

		s.taboption('general', cbiKeyPairGenerate, '_gen_server_keypair', ' ');

		o = s.taboption('general', form.Value, 'listen_port', _('Listen Port'), _('Optional. UDP port used for outgoing and incoming packets.'));
		o.datatype = 'port';
		o.placeholder = _('random');
		o.optional = true;

		o = s.taboption('general', form.DynamicList, 'addresses', _('IP Addresses'), _('Recommended. IP addresses of the AmneziaWG interface.'));
		o.datatype = 'ipaddr';
		o.optional = true;

		o = s.taboption('general', form.Flag, 'nohostroute', _('No Host Routes'), _('Optional. Do not create host routes to peers.'));
		o.optional = true;

		o = s.taboption('general', form.Button, '_import', _('Import configuration'), _('Imports settings from an existing AmneziaWG configuration file'));
		o.inputtitle = _('Load configuration…');
		o.onclick = function() {
			return ss.handleConfigImport('full');
		};

		// -- advanced --------------------------------------------------------------------

		o = s.taboption('advanced', form.Value, 'mtu', _('MTU'), _('Optional. Maximum Transmission Unit of tunnel interface.'));
		o.datatype = 'range(0,8940)';
		o.placeholder = '1420';
		o.optional = true;

		o = s.taboption('advanced', form.Value, 'fwmark', _('Firewall Mark'), _('Optional. 32-bit mark for packets during firewall processing. Enter value in hex, starting with <code>0x</code>.'));
		o.optional = true;
		o.validate = function(section_id, value) {
			if (value.length > 0 && !value.match(/^0x[a-fA-F0-9]{1,8}$/))
				return _('Invalid hexadecimal value');

			return true;
		};

        // AmneziaWG

        try {
            s.tab('amneziawg', _('AmneziaWG Settings'), _('Further information about AmneziaWG interfaces and peers at <a href=\'https://docs.amnezia.org/documentation/amnezia-wg\'>amnezia.org</a>.'));
        }
        catch(e) {}

		addSettingGroup(s, 'amneziawg', '_awg_group_junk', _('Junk packets'),
			_('Packet count and size values used to disguise AmneziaWG traffic. Importing a known-good configuration is recommended.'));

        o = s.taboption('amneziawg', form.Value, 'awg_jc', _('Jc'), _('Junk packet count.'));
        o.datatype = 'uinteger';
        o.placeholder = '0';
        o.optional = true;

        o = s.taboption('amneziawg', form.Value, 'awg_jmin', _('Jmin'), _('Junk packet minimum size.'));
        o.datatype = 'uinteger';
        o.placeholder = '0';
        o.optional = true;

        o = s.taboption('amneziawg', form.Value, 'awg_jmax', _('Jmax'), _('Junk packet maximum size.'));
        o.datatype = 'uinteger';
        o.placeholder = '0';
        o.optional = true;

		addSettingGroup(s, 'amneziawg', '_awg_group_padding', _('Packet padding'),
			_('Junk header sizes for handshake, cookie reply and transport packets.'));

        o = s.taboption('amneziawg', form.Value, 'awg_s1', _('S1'), _('Handshake initiation packet junk header size.'));
        o.datatype = 'uinteger';
        o.placeholder = '0';
        o.optional = true;

        o = s.taboption('amneziawg', form.Value, 'awg_s2', _('S2'), _('Handshake response packet junk header size.'));
        o.datatype = 'uinteger';
        o.placeholder = '0';
        o.optional = true;
		
		o = s.taboption('amneziawg', form.Value, 'awg_s3', _('S3'), _('Cookie reply packet junk header size.'));
        o.datatype = 'uinteger';
        o.placeholder = '0';
        o.optional = true;
		
		o = s.taboption('amneziawg', form.Value, 'awg_s4', _('S4'), _('Transport packet junk header size.'));
        o.datatype = 'uinteger';
		o.placeholder = '0';
        o.optional = true;

		addSettingGroup(s, 'amneziawg', '_awg_group_headers', _('Packet type headers'),
			_('Packet type values must match the configuration on the remote peer.'));

        o = s.taboption('amneziawg', form.Value, 'awg_h1', _('H1'), _('Handshake initiation packet type header.'));
		o.validate = validateUint32Range;
        o.placeholder = '1';
        o.optional = true;

        o = s.taboption('amneziawg', form.Value, 'awg_h2', _('H2'), _('Handshake response packet type header.'));
		o.validate = validateUint32Range;
        o.placeholder = '2';
        o.optional = true;

        o = s.taboption('amneziawg', form.Value, 'awg_h3', _('H3'), _('Handshake cookie packet type header.'));
		o.validate = validateUint32Range;
        o.placeholder = '3';
        o.optional = true;

        o = s.taboption('amneziawg', form.Value, 'awg_h4', _('H4'), _('Transport packet type header.'));
		o.validate = validateUint32Range;
		o.placeholder = '4';
        o.optional = true;

		addSettingGroup(s, 'amneziawg', '_awg_group_signatures', _('Special packet signatures'),
			_('Optional signatures for special junk packets.'));
		
		o = s.taboption('amneziawg', form.Value, 'awg_i1', _('I1'), _('First special junk packet signature.'));
        o.datatype = 'string';
        o.optional = true;
		
		o = s.taboption('amneziawg', form.Value, 'awg_i2', _('I2'), _('Second special junk packet signature.'));
        o.datatype = 'string';
        o.optional = true;
		
		o = s.taboption('amneziawg', form.Value, 'awg_i3', _('I3'), _('Third special junk packet signature.'));
        o.datatype = 'string';
        o.optional = true;
		
		o = s.taboption('amneziawg', form.Value, 'awg_i4', _('I4'), _('Fourth special junk packet signature.'));
        o.datatype = 'string';
        o.optional = true;
		
		o = s.taboption('amneziawg', form.Value, 'awg_i5', _('I5'), _('Fifth special junk packet signature.'));
		o.datatype = 'string';
        o.optional = true;

		addSettingGroup(s, 'amneziawg', '_awg_group_protection', _('Header protection'),
			_('AWG 3.x header protection settings. The key and S1-S4 values must match on both sides.'));

		o = s.taboption('amneziawg', form.Value, 'awg_header_protection_key', _('Header Protection Key'), _('AWG 3.x. Base64 key used to protect packet headers. The same key is required on both sides; S1-S4 must each be at least 12.'));
		o.password = true;
		o.optional = true;
		o.validate = function(section_id, value) {
			var result = validateBase64(section_id, value);

			if (result !== true || !value)
				return result;

			var paddingOptions = [ 'awg_s1', 'awg_s2', 'awg_s3', 'awg_s4' ];
			for (var i = 0; i < paddingOptions.length; i++) {
				var padding = s.formvalue(section_id, paddingOptions[i]) ||
					uci.get('network', section_id, paddingOptions[i]);

				if (!padding || !padding.match(/^\d+$/) || Number(padding) < 12)
					return _('Header protection requires S1, S2, S3 and S4 to be at least 12');
			}

			return true;
		};

		o = s.taboption('amneziawg', form.Button, '_gen_header_protection_key', _('Generate Header Protection Key'));
		o.inputtitle = _('Generate key');
		o.inputstyle = 'apply';
		o.onclick = function(ev, section_id) {
			return generateKey().then(function(keypair) {
				s.getOption('awg_header_protection_key').getUIElement(section_id).setValue(keypair.priv);
			});
		};

		o = s.taboption('amneziawg', form.Value, 'awg_content_padding_addition', _('Content Padding Addition'), _('AWG 3.x. Optional random byte padding range added to transport packets.'));
		o.validate = validateUint16Range;
		o.placeholder = _('disabled');
		o.optional = true;

		addSettingGroup(s, 'amneziawg', '_awg_group_timing', _('Handshake timing'),
			_('Advanced AWG 3.x timing values. Leave them at their defaults unless the peer configuration specifies them.'));

		o = s.taboption('amneziawg', form.Value, 'awg_rekey_after_time', _('Rekey After Time'), _('AWG 3.x. Seconds before initiating a new handshake; accepts a number or range.'));
		o.validate = validateUint16Range;
		o.placeholder = _('default');
		o.optional = true;

		o = s.taboption('amneziawg', form.Value, 'awg_rekey_timeout', _('Rekey Timeout'), _('AWG 3.x. Seconds before retrying a handshake; accepts a number or range.'));
		o.validate = validateUint16Range;
		o.placeholder = _('default');
		o.optional = true;

		o = s.taboption('amneziawg', form.Value, 'awg_reject_after_time', _('Reject After Time'), _('AWG 3.x. Seconds before expiring keys and rejecting traffic; accepts a number or range.'));
		o.validate = validateUint16Range;
		o.placeholder = _('default');
		o.optional = true;

		o = s.taboption('amneziawg', form.Value, 'awg_keepalive_timeout', _('Keepalive Timeout'), _('AWG 3.x. Idle seconds before sending a keepalive; accepts a number or range.'));
		o.validate = validateUint16Range;
		o.placeholder = _('default');
		o.optional = true;

		o = s.taboption('amneziawg', form.Value, 'awg_max_handshake_attempts', _('Maximum Handshake Attempts'), _('AWG 3.x. Maximum handshake retries; accepts a number or range.'));
		o.validate = validateUint16Range;
		o.placeholder = _('default');
		o.optional = true;

		addSettingGroup(s, 'amneziawg', '_awg_group_awg31', _('AWG 3.1 options'),
			_('Optional traffic-shaping and active-probing resistance settings. Values must match on both sides where noted.'));

		o = s.taboption('amneziawg', form.Flag, 'awg_random_trailers', _('Random Trailers'), _('AWG 3.1. Append a random trailer to packets to vary their sizes. This setting must be identical on both sides.'));
		o.default = o.disabled;
		o.optional = true;

		o = s.taboption('amneziawg', form.Flag, 'awg_disable_cookies', _('Disable Cookies'), _('AWG 3.1. Disable WireGuard cookie replies. This reduces an active-probing fingerprint but may prevent new handshakes while the interface is under load.'));
		o.default = o.disabled;
		o.optional = true;

		// -- peers -----------------------------------------------------------------------

		try {
			s.tab('peers', _('Peers'), _('Further information about AmneziaWG interfaces and peers at <a href=\'https://docs.amnezia.org/documentation/amnezia-wg\'>amnezia.org</a>.'));
		}
		catch(e) {}

		o = s.taboption('peers', form.SectionValue, '_peers', form.GridSection, 'amneziawg_%s'.format(s.section));
		o.depends('proto', 'amneziawg');

		ss = o.subsection;
		ss.anonymous = true;
		ss.addremove = true;
		ss.addbtntitle = _('Add peer');
		ss.nodescriptions = true;
		ss.modaltitle = _('Edit peer');
		ss.sortable = true;

			ss.handleDragConfig = function(ev) {
				ev.stopPropagation();
				ev.preventDefault();
				ev.dataTransfer.dropEffect = 'copy';
				ev.currentTarget.classList.add('awg-drag-active');
			};

			ss.handleDragLeaveConfig = function(ev) {
				ev.currentTarget.classList.remove('awg-drag-active');
			};

			ss.loadConfigFile = function(nodes, file) {
				var input = nodes.querySelector('textarea'),
				    fileName = nodes.querySelector('.awg-import-file'),
				    reader = new FileReader();

				if (!file)
					return;

				reader.onload = function(rev) {
					input.value = rev.target.result.trim();
					nodes.setAttribute('data-filename', file.name);
					fileName.textContent = _('Selected file: %s').format(file.name);
				};

				reader.readAsText(file);
			};

			ss.handleDropConfig = function(mode, ev) {
				var file = ev.dataTransfer.files[0],
				    nodes = ev.currentTarget;

				nodes.classList.remove('awg-drag-active');
				this.loadConfigFile(nodes, file);

				ev.stopPropagation();
				ev.preventDefault();
		};

		ss.parseConfig = function(data) {
			var lines = String(data).split(/(\r?\n)+/),
			    section = null,
			    config = { peers: [] },
			    s;

			for (var i = 0; i < lines.length; i++) {
				var line = lines[i].replace(/#.*$/, '').trim();

				if (line.match(/^\[(\w+)\]$/)) {
					section = RegExp.$1.toLowerCase();

					if (section == 'peer')
						config.peers.push(s = {});
					else
						s = config;
				}
				else if (section && line.match(/^(\w+)\s*=\s*(.+)$/)) {
					var key = RegExp.$1,
					    val = RegExp.$2.trim();

					if (val.length)
						s[section + '_' + key.toLowerCase()] = val;
				}
			}

			if (config.interface_address) {
				config.interface_address = config.interface_address.split(/[, ]+/);

				for (var i = 0; i < config.interface_address.length; i++)
					if (!stubValidator.apply('ipaddr', config.interface_address[i]))
						return _('Address setting is invalid');
			}

			if (config.interface_dns) {
				config.interface_dns = config.interface_dns.split(/[, ]+/);

				for (var i = 0; i < config.interface_dns.length; i++)
					if (!stubValidator.apply('ipaddr', config.interface_dns[i], ['nomask']))
						return _('DNS setting is invalid');
			}

			if (!config.interface_privatekey || validateBase64(null, config.interface_privatekey) !== true)
				return _('PrivateKey setting is missing or invalid');

			if (!stubValidator.apply('port', config.interface_listenport || '0'))
				return _('ListenPort setting is invalid');

			if (config.interface_headerprotectionkey != null &&
			    validateBase64(null, config.interface_headerprotectionkey) !== true)
				return _('HeaderProtectionKey setting is invalid');

			if (config.interface_headerprotectionkey) {
				var paddingSettings = [ 'interface_s1', 'interface_s2', 'interface_s3', 'interface_s4' ];
				for (var i = 0; i < paddingSettings.length; i++)
					if (!config[paddingSettings[i]] || !config[paddingSettings[i]].match(/^\d+$/) ||
					    Number(config[paddingSettings[i]]) < 12)
						return _('Header protection requires S1, S2, S3 and S4 to be at least 12');
			}

			var uint32RangeSettings = [ 'interface_h1', 'interface_h2', 'interface_h3', 'interface_h4' ];
			for (var i = 0; i < uint32RangeSettings.length; i++)
				if (config[uint32RangeSettings[i]] != null &&
				    validateUint32Range(null, config[uint32RangeSettings[i]]) !== true)
					return _('H1-H4 settings must be valid 32-bit numbers or ranges');

			var uint16RangeSettings = [
				'interface_contentpaddingaddition',
				'interface_rekeyaftertime',
				'interface_rekeytimeout',
				'interface_rejectaftertime',
				'interface_keepalivetimeout',
				'interface_maxhandshakeattempts'
			];
			for (var i = 0; i < uint16RangeSettings.length; i++)
				if (config[uint16RangeSettings[i]] != null &&
				    validateUint16Range(null, config[uint16RangeSettings[i]]) !== true)
					return _('AWG 3.x timing and padding settings must be valid 16-bit numbers or ranges');

			var booleanSettings = [ 'interface_randomtrailers', 'interface_disablecookies' ];
			for (var i = 0; i < booleanSettings.length; i++)
				if (config[booleanSettings[i]] != null &&
				    validateAwgBoolean(null, config[booleanSettings[i]]) !== true)
					return _('AWG 3.1 boolean settings must be "on", "off", or non-negative integers');

			for (var i = 0; i < config.peers.length; i++) {
				var pconf = config.peers[i];

				if (pconf.peer_publickey != null && validateBase64(null, pconf.peer_publickey) !== true)
					return _('PublicKey setting is invalid');

				if (pconf.peer_presharedkey != null && validateBase64(null, pconf.peer_presharedkey) !== true)
					return _('PresharedKey setting is invalid');

				if (pconf.peer_allowedips) {
					pconf.peer_allowedips = pconf.peer_allowedips.split(/[, ]+/);

					for (var j = 0; j < pconf.peer_allowedips.length; j++)
						if (!stubValidator.apply('ipaddr', pconf.peer_allowedips[j]))
							return _('AllowedIPs setting is invalid');
				}
				else {
					pconf.peer_allowedips = [ '0.0.0.0/0', '::/0' ];
				}

				if (pconf.peer_endpoint) {
					var host_port = pconf.peer_endpoint.match(/^\[([a-fA-F0-9:]+)\]:(\d+)$/) || pconf.peer_endpoint.match(/^(.+):(\d+)$/);

					if (!host_port || !stubValidator.apply('host', host_port[1]) || !stubValidator.apply('port', host_port[2]))
						return _('Endpoint setting is invalid');

					pconf.peer_endpoint = [ host_port[1], host_port[2] ];
				}

				if (pconf.peer_persistentkeepalive == 'off' || pconf.peer_persistentkeepalive == '0')
					delete pconf.peer_persistentkeepalive;

				if (validateUint16Range(null, pconf.peer_persistentkeepalive || '0') !== true)
					return _('PersistentKeepAlive setting is invalid');
			}

			return config;
		};

			ss.handleApplyConfig = function(mode, nodes, comment, ev) {
				var input = nodes.querySelector('textarea').value,
				    error = nodes.querySelector('.alert-message'),
				    cancel = nodes.nextElementSibling.querySelector('.btn'),
				    config = this.parseConfig(input);

				comment = comment || nodes.getAttribute('data-filename');

			if (typeof(config) == 'string') {
				error.firstChild.data = _('Cannot parse configuration: %s').format(config);
				error.style.display = 'block';
				return;
			}

			if (mode == 'full') {
				var prv = s.formvalue(s.section, 'private_key');

				if (prv && prv != config.interface_privatekey && !confirm(_('Overwrite the current settings with the imported configuration?')))
					return;

				return getPublicAndPrivateKeyFromPrivate(config.interface_privatekey).then(function(keypair) {
					s.getOption('private_key').getUIElement(s.section).setValue(keypair.priv);
					s.getOption('public_key').getUIElement(s.section).setValue(keypair.pub);
					s.getOption('listen_port').getUIElement(s.section).setValue(config.interface_listenport || '');
					s.getOption('addresses').getUIElement(s.section).setValue(config.interface_address);
					s.getOption('awg_jc').getUIElement(s.section).setValue(config.interface_jc || '');
					s.getOption('awg_jmin').getUIElement(s.section).setValue(config.interface_jmin || '');
					s.getOption('awg_jmax').getUIElement(s.section).setValue(config.interface_jmax || '');
					s.getOption('awg_s1').getUIElement(s.section).setValue(config.interface_s1 || '');
					s.getOption('awg_s2').getUIElement(s.section).setValue(config.interface_s2 || '');
					s.getOption('awg_s3').getUIElement(s.section).setValue(config.interface_s3 || '');
					s.getOption('awg_s4').getUIElement(s.section).setValue(config.interface_s4 || '');
					s.getOption('awg_h1').getUIElement(s.section).setValue(config.interface_h1 || '');
					s.getOption('awg_h2').getUIElement(s.section).setValue(config.interface_h2 || '');
					s.getOption('awg_h3').getUIElement(s.section).setValue(config.interface_h3 || '');
					s.getOption('awg_h4').getUIElement(s.section).setValue(config.interface_h4 || '');
					s.getOption('awg_i1').getUIElement(s.section).setValue(config.interface_i1 || '');
					s.getOption('awg_i2').getUIElement(s.section).setValue(config.interface_i2 || '');
					s.getOption('awg_i3').getUIElement(s.section).setValue(config.interface_i3 || '');
					s.getOption('awg_i4').getUIElement(s.section).setValue(config.interface_i4 || '');
					s.getOption('awg_i5').getUIElement(s.section).setValue(config.interface_i5 || '');
					s.getOption('awg_header_protection_key').getUIElement(s.section).setValue(config.interface_headerprotectionkey || '');
					s.getOption('awg_content_padding_addition').getUIElement(s.section).setValue(config.interface_contentpaddingaddition || '');
					s.getOption('awg_rekey_after_time').getUIElement(s.section).setValue(config.interface_rekeyaftertime || '');
					s.getOption('awg_rekey_timeout').getUIElement(s.section).setValue(config.interface_rekeytimeout || '');
					s.getOption('awg_reject_after_time').getUIElement(s.section).setValue(config.interface_rejectaftertime || '');
					s.getOption('awg_keepalive_timeout').getUIElement(s.section).setValue(config.interface_keepalivetimeout || '');
					s.getOption('awg_max_handshake_attempts').getUIElement(s.section).setValue(config.interface_maxhandshakeattempts || '');
					s.getOption('awg_random_trailers').getUIElement(s.section).setValue(awgBooleanToFlag(config.interface_randomtrailers));
					s.getOption('awg_disable_cookies').getUIElement(s.section).setValue(awgBooleanToFlag(config.interface_disablecookies));

					if (config.interface_dns)
						s.getOption('dns').getUIElement(s.section).setValue(config.interface_dns);

					for (var i = 0; i < config.peers.length; i++) {
						var pconf = config.peers[i];
						var sid = uci.add('network', 'amneziawg_' + s.section);

						uci.sections('network', 'amneziawg_' + s.section, function(peer) {
							if (peer.public_key == pconf.peer_publickey)
								uci.remove('network', peer['.name']);
						});

						uci.set('network', sid, 'description', comment || _('Imported peer configuration'));
						uci.set('network', sid, 'public_key', pconf.peer_publickey);
						uci.set('network', sid, 'preshared_key', pconf.peer_presharedkey);
						uci.set('network', sid, 'allowed_ips', pconf.peer_allowedips);
						uci.set('network', sid, 'persistent_keepalive', pconf.peer_persistentkeepalive);

						if (pconf.peer_endpoint) {
							uci.set('network', sid, 'endpoint_host', pconf.peer_endpoint[0]);
							uci.set('network', sid, 'endpoint_port', pconf.peer_endpoint[1]);
						}
					}

					return s.map.save(null, true);
				}).then(function() {
					cancel.click();
				});
			}
			else {
				return getPublicAndPrivateKeyFromPrivate(config.interface_privatekey).then(function(keypair) {
					var sid = uci.add('network', 'amneziawg_' + s.section);
					var pub = s.formvalue(s.section, 'public_key');

					uci.sections('network', 'amneziawg_' + s.section, function(peer) {
						if (peer.public_key == keypair.pub)
							uci.remove('network', peer['.name']);
					});

					uci.set('network', sid, 'description', comment || _('Imported peer configuration'));
					uci.set('network', sid, 'public_key', keypair.pub);
					uci.set('network', sid, 'private_key', keypair.priv);

					for (var i = 0; i < config.peers.length; i++) {
						var pconf = config.peers[i];

						if (pconf.peer_publickey == pub) {
							uci.set('network', sid, 'preshared_key', pconf.peer_presharedkey);
							uci.set('network', sid, 'allowed_ips', pconf.peer_allowedips);
							uci.set('network', sid, 'persistent_keepalive', pconf.peer_persistentkeepalive);
							break;
						}
					}

					return s.map.save(null, true);
				}).then(function() {
					cancel.click();
				});
			}
		};

		ss.handleConfigImport = function(mode) {
			var mapNode = ss.getActiveModalMap(),
			    headNode = mapNode.parentNode.querySelector('h4'),
			    parent = this.map;

				var nodes = E('div', {
					'class': 'awg-import-panel',
					'dragover': this.handleDragConfig,
					'dragleave': this.handleDragLeaveConfig,
					'drop': this.handleDropConfig.bind(this, mode)
				}, [
					E([], (mode == 'full') ? [
					E('p', _('Drag or paste a valid <em>*.conf</em> file below to configure the local AmneziaWG interface.'))
				] : [
					E('p', _('Paste or drag a AmneziaWG configuration (commonly <em>wg0.conf</em>) from another system below to create a matching peer entry allowing that system to connect to the local AmneziaWG interface.')),
					E('p', _('To configure fully the local AmneziaWG interface from an existing (e.g. provider supplied) configuration file, use the <strong><a class="full-import" href="#">configuration import</a></strong> instead.'))
				]),
					E('div', { 'class': 'awg-import-actions' }, [
						E('label', { 'class': 'btn cbi-button' }, [
							_('Choose .conf file…'),
							E('input', {
								'type': 'file',
								'accept': '.conf,text/plain',
								'style': 'display:none',
								'change': function(ev) {
									ss.loadConfigFile(nodes, ev.currentTarget.files[0]);
								}
							})
						]),
						E('span', { 'class': 'awg-import-file' }, [ _('No file selected') ])
					]),
					E('p', [
						E('textarea', {
							'class': 'awg-import-textarea',
							'placeholder': (mode == 'full')
								? _('Paste or drag supplied AmneziaWG configuration file…')
								: _('Paste or drag AmneziaWG peer configuration (wg0.conf) file…')
						})
				]),
				E('div', {
					'class': 'alert-message',
					'style': 'display:none'
				}, [''])
			]);

			var cancelFn = function() {
				nodes.parentNode.removeChild(nodes.nextSibling);
				nodes.parentNode.removeChild(nodes);
				mapNode.classList.remove('hidden');
				mapNode.nextSibling.classList.remove('hidden');
				headNode.removeChild(headNode.lastChild);
				window.removeEventListener('dragover', handleWindowDragDropIgnore);
				window.removeEventListener('drop', handleWindowDragDropIgnore);
			};

			var a = nodes.querySelector('a.full-import');

			if (a) {
				a.addEventListener('click', ui.createHandlerFn(this, function(mode) {
					cancelFn();
					this.handleConfigImport('full');
				}));
			}

			mapNode.classList.add('hidden');
			mapNode.nextElementSibling.classList.add('hidden');

			headNode.appendChild(E('span', [ ' » ', (mode == 'full') ? _('Import configuration') : _('Import as peer') ]));
			mapNode.parentNode.appendChild(E([], [
				nodes,
				E('div', {
					'class': 'right'
				}, [
					E('button', {
						'class': 'btn',
						'click': cancelFn
					}, [ _('Cancel') ]),
					' ',
					E('button', {
						'class': 'btn primary',
						'click': ui.createHandlerFn(this, 'handleApplyConfig', mode, nodes, null)
					}, [ _('Import settings') ])
				])
			]));

			window.addEventListener('dragover', handleWindowDragDropIgnore);
			window.addEventListener('drop', handleWindowDragDropIgnore);
		};

		ss.renderSectionAdd = function(/* ... */) {
			var nodes = this.super('renderSectionAdd', arguments);

			nodes.appendChild(E('button', {
				'class': 'btn',
				'click': ui.createHandlerFn(this, 'handleConfigImport', 'peer')
			}, [ _('Import configuration as peer…') ]));

			return nodes;
		};

		ss.renderSectionPlaceholder = function() {
			return E('em', _('No peers defined yet.'));
		};

		o = ss.option(form.Flag, 'disabled', _('Disabled'), _('Enable / Disable peer. Restart amneziawg interface to apply changes.'));
		o.editable = true;
		o.optional = true;
		o.width = '5%';

		o = ss.option(form.Value, 'description', _('Description'), _('Optional. Description of peer.'));
		o.placeholder = 'My Peer';
		o.datatype = 'string';
		o.optional = true;
		o.width = '30%';
		o.textvalue = function(section_id) {
			var dis = ss.getOption('disabled'),
			    pub = ss.getOption('public_key'),
			    prv = ss.getOption('private_key'),
			    psk = ss.getOption('preshared_key'),
			    name = this.cfgvalue(section_id),
			    key = pub.cfgvalue(section_id);

			var desc = [
				E('p', [
					name ? E('span', [ name ]) : E('em', [ _('Untitled peer') ])
				])
			];

			if (dis.cfgvalue(section_id) == '1')
				desc.push(E('span', {
					'class': 'ifacebadge',
					'data-tooltip': _('AmneziaWG peer is disabled')
				}, [
					E('em', [ _('Disabled', 'Label indicating that AmneziaWG peer is disabled') ])
				]), ' ');

			if (!key || !pub.isValid(section_id)) {
				desc.push(E('span', {
					'class': 'ifacebadge',
					'data-tooltip': _('Public key is missing')
				}, [
					E('em', [ _('Key missing', 'Label indicating that AmneziaWG peer lacks public key') ])
				]));
			}
			else {
				desc.push(
					E('span', {
						'class': 'ifacebadge',
						'data-tooltip': _('Public key: %h', 'Tooltip displaying full AmneziaWG peer public key').format(key)
					}, [
						E('code', [ key.replace(/^(.{5}).+(.{6})$/, '$1…$2') ])
					]),
					' ',
					(prv.cfgvalue(section_id) && prv.isValid(section_id))
						? E('span', {
							'class': 'ifacebadge',
							'data-tooltip': _('Private key present')
						}, [ _('Private', 'Label indicating that AmneziaWG peer private key is stored') ]) : '',
					' ',
					(psk.cfgvalue(section_id) && psk.isValid(section_id))
						? E('span', {
							'class': 'ifacebadge',
							'data-tooltip': _('Preshared key in use')
						}, [ _('PSK', 'Label indicating that AmneziaWG peer uses a PSK') ]) : ''
				);
			}

			return E([], desc);
		};

		function handleKeyChange(ev, section_id, value) {
			var prv = this.section.getUIElement(section_id, 'private_key'),
			    btn = this.map.findElement('.btn.qr-code');

			btn.disabled = (!prv.isValid() || !prv.getValue());
		}

		o = ss.option(form.Value, 'public_key', _('Public Key'), _('Required. Public key of the AmneziaWG peer.'));
		o.modalonly = true;
		o.validate = validateBase64;
		o.onchange = handleKeyChange;

		o = ss.option(form.Value, 'private_key', _('Private Key'), _('Optional. Private key of the AmneziaWG peer. The key is not required for establishing a connection but allows generating a peer configuration or QR code if available. It can be removed after the configuration has been exported.'));
		o.modalonly = true;
		o.validate = validateBase64;
		o.onchange = handleKeyChange;
		o.password = true;

		o = ss.option(cbiKeyPairGenerate, '_gen_peer_keypair', ' ');
		o.modalonly = true;

		o = ss.option(form.Value, 'preshared_key', _('Preshared Key'), _('Optional. Base64-encoded preshared key. Adds in an additional layer of symmetric-key cryptography for post-quantum resistance.'));
		o.modalonly = true;
		o.validate = validateBase64;
		o.password = true;

		o = ss.option(form.DummyValue, '_gen_psk', ' ');
		o.modalonly = true;
		o.cfgvalue = function(section_id, value) {
			return E('button', {
				'class': 'btn',
				'click': ui.createHandlerFn(this, function(section_id, ev) {
					var psk = this.section.getUIElement(section_id, 'preshared_key'),
					    map = this.map;

					return generatePsk().then(function(key) {
						psk.setValue(key);
						map.save(null, true);
					});
				}, section_id)
			}, [ _('Generate preshared key') ]);
		};

		o = ss.option(form.DynamicList, 'allowed_ips', _('Allowed IPs'), _("Optional. IP addresses and prefixes that this peer is allowed to use inside the tunnel. Usually the peer's tunnel IP addresses and the networks the peer routes through the tunnel."));
		o.datatype = 'ipaddr';
		o.textvalue = function(section_id) {
			var ips = L.toArray(this.cfgvalue(section_id)),
			    list = [];

			for (var i = 0; i < ips.length; i++) {
				if (i > 7) {
					list.push(E('em', {
						'class': 'ifacebadge cbi-tooltip-container'
					}, [
						_('+ %d more', 'Label indicating further amount of allowed ips').format(ips.length - i),
						E('span', {
							'class': 'cbi-tooltip'
						}, [
							E('ul', ips.map(function(ip) {
								return E('li', [
									E('span', { 'class': 'ifacebadge' }, [ ip ])
								]);
							}))
						])
					]));

					break;
				}

				list.push(E('span', { 'class': 'ifacebadge' }, [ ips[i] ]));
			}

			if (!list.length)
				list.push('*');

			return E('span', { 'style': 'display:inline-flex;flex-wrap:wrap;gap:.125em' }, list);
		};

		o = ss.option(form.Flag, 'route_allowed_ips', _('Route Allowed IPs'), _('Optional. Create routes for Allowed IPs for this peer.'));
		o.modalonly = true;

		o = ss.option(form.Value, 'endpoint_host', _('Endpoint Host'), _('Optional. Host of peer. Names are resolved prior to bringing up the interface.'));
		o.placeholder = 'vpn.example.com';
		o.datatype = 'host';
		o.textvalue = function(section_id) {
			var host = this.cfgvalue(section_id),
			    port = this.section.cfgvalue(section_id, 'endpoint_port');

			return (host && port)
				? '%h:%d'.format(host, port)
				: (host
					? '%h:*'.format(host)
					: (port
						? '*:%d'.format(port)
						: '*'));
		};

		o = ss.option(form.Value, 'endpoint_port', _('Endpoint Port'), _('Optional. Port of peer.'));
		o.modalonly = true;
		o.placeholder = '51820';
		o.datatype = 'port';

		o = ss.option(form.Value, 'persistent_keepalive', _('Persistent Keep Alive'), _('Optional. Seconds between keep alive messages. AWG 3.x accepts a range such as 20-30. Default is 0 (disabled).'));
		o.modalonly = true;
		o.validate = validateUint16Range;
		o.placeholder = '0';



		o = ss.option(form.DummyValue, '_keyops', _('Configuration Export'),
			_('Generates a configuration suitable for import on a AmneziaWG peer'));

		o.modalonly = true;

		o.createPeerConfig = function(section_id, endpoint, ips, eips, dns) {
			var pub = s.formvalue(s.section, 'public_key'),
			    port = s.formvalue(s.section, 'listen_port') || '51820',
				jc = s.formvalue(s.section, 'awg_jc'),
				jmin = s.formvalue(s.section, 'awg_jmin'),
				jmax = s.formvalue(s.section, 'awg_jmax'),
				s1 = s.formvalue(s.section, 'awg_s1'),
				s2 = s.formvalue(s.section, 'awg_s2'),
				s3 = s.formvalue(s.section, 'awg_s3'),
				s4 = s.formvalue(s.section, 'awg_s4'),
				h1 = s.formvalue(s.section, 'awg_h1'),
				h2 = s.formvalue(s.section, 'awg_h2'),
				h3 = s.formvalue(s.section, 'awg_h3'),
				h4 = s.formvalue(s.section, 'awg_h4'),
				i1 = s.formvalue(s.section, 'awg_i1'),
				i2 = s.formvalue(s.section, 'awg_i2'),
				i3 = s.formvalue(s.section, 'awg_i3'),
				i4 = s.formvalue(s.section, 'awg_i4'),
				i5 = s.formvalue(s.section, 'awg_i5'),
				headerProtectionKey = s.formvalue(s.section, 'awg_header_protection_key'),
				contentPaddingAddition = s.formvalue(s.section, 'awg_content_padding_addition'),
				rekeyAfterTime = s.formvalue(s.section, 'awg_rekey_after_time'),
				rekeyTimeout = s.formvalue(s.section, 'awg_rekey_timeout'),
				rejectAfterTime = s.formvalue(s.section, 'awg_reject_after_time'),
				keepaliveTimeout = s.formvalue(s.section, 'awg_keepalive_timeout'),
				maxHandshakeAttempts = s.formvalue(s.section, 'awg_max_handshake_attempts'),
				randomTrailers = s.formvalue(s.section, 'awg_random_trailers'),
				disableCookies = s.formvalue(s.section, 'awg_disable_cookies'),
			    prv = this.section.formvalue(section_id, 'private_key'),
			    psk = this.section.formvalue(section_id, 'preshared_key'),
			    eport = this.section.formvalue(section_id, 'endpoint_port'),
			    keep = this.section.formvalue(section_id, 'persistent_keepalive');

			// If endpoint is IPv6 we must escape it with []
			if (endpoint.indexOf(':') > 0) {
				endpoint = '['+endpoint+']';
			}

			return [
				'[Interface]',
				'PrivateKey = ' + prv,
				eips && eips.length ? 'Address = ' + eips.join(', ') : '# Address not defined',
				eport ? 'ListenPort = ' + eport : '# ListenPort not defined',
				dns && dns.length ? 'DNS = ' + dns.join(', ') : '# DNS not defined',
				jc ? 'Jc = ' + jc : '# Jc not defined',
				jmin ? 'Jmin = ' + jmin : '# Jmin not defined',
				jmax ? 'Jmax = ' + jmax : '# Jmax not defined',
				s1 ? 'S1 = ' + s1 : '# S1 not defined',
				s2 ? 'S2 = ' + s2 : '# S2 not defined',
				s3 ? 'S3 = ' + s3 : '# S3 not defined',
				s4 ? 'S4 = ' + s4 : '# S4 not defined',
				h1 ? 'H1 = ' + h1 : '# H1 not defined',
				h2 ? 'H2 = ' + h2 : '# H2 not defined',
				h3 ? 'H3 = ' + h3 : '# H3 not defined',
				h4 ? 'H4 = ' + h4 : '# H4 not defined',
				i1 ? 'I1 = ' + i1 : '# I1 not defined',
				i2 ? 'I2 = ' + i2 : '# I2 not defined',
				i3 ? 'I3 = ' + i3 : '# I3 not defined',
				i4 ? 'I4 = ' + i4 : '# I4 not defined',
				i5 ? 'I5 = ' + i5 : '# I5 not defined',
				headerProtectionKey ? 'HeaderProtectionKey = ' + headerProtectionKey : '# HeaderProtectionKey not defined',
				contentPaddingAddition ? 'ContentPaddingAddition = ' + contentPaddingAddition : '# ContentPaddingAddition not defined',
				rekeyAfterTime ? 'RekeyAfterTime = ' + rekeyAfterTime : '# RekeyAfterTime not defined',
				rekeyTimeout ? 'RekeyTimeout = ' + rekeyTimeout : '# RekeyTimeout not defined',
				rejectAfterTime ? 'RejectAfterTime = ' + rejectAfterTime : '# RejectAfterTime not defined',
				keepaliveTimeout ? 'KeepaliveTimeout = ' + keepaliveTimeout : '# KeepaliveTimeout not defined',
				maxHandshakeAttempts ? 'MaxHandshakeAttempts = ' + maxHandshakeAttempts : '# MaxHandshakeAttempts not defined',
				randomTrailers != null ? 'RandomTrailers = ' + awgBooleanToConfig(randomTrailers) : '# RandomTrailers not defined',
				disableCookies != null ? 'DisableCookies = ' + awgBooleanToConfig(disableCookies) : '# DisableCookies not defined',
				'',
				'[Peer]',
				'PublicKey = ' + pub,
				psk ? 'PresharedKey = ' + psk : '# PresharedKey not used',
				ips && ips.length ? 'AllowedIPs = ' + ips.join(', ') : '# AllowedIPs not defined',
				endpoint ? 'Endpoint = ' + endpoint + ':' + port : '# Endpoint not defined',
				keep ? 'PersistentKeepalive = ' + keep : '# PersistentKeepalive not defined'
			].join('\n');
		};

		o.handleGenerateQR = function(section_id, ev) {
			var mapNode = ss.getActiveModalMap(),
			    headNode = mapNode.parentNode.querySelector('h4'),
			    configGenerator = this.createPeerConfig.bind(this, section_id),
			    parent = this.map,
				eips = this.section.formvalue(section_id, 'allowed_ips');

			return Promise.all([
				network.getWANNetworks(),
				network.getWAN6Networks(),
				network.getNetwork('lan'),
				L.resolveDefault(uci.load('ddns')),
				L.resolveDefault(uci.load('system')),
				parent.save(null, true)
			]).then(function(data) {
				var hostnames = [];

				uci.sections('ddns', 'service', function(s) {
					if (typeof(s?.lookup_host) == 'string' && s?.enabled == '1')
						hostnames.push(s.lookup_host);
				});

				uci.sections('system', 'system', function(s) {
					if (typeof(s?.hostname) == 'string' && s?.hostname?.indexOf('.') > 0)
						hostnames.push(s.hostname);
				});

				for (var i = 0; i < data[0].length; i++)
					hostnames.push.apply(hostnames, data[0][i].getIPAddrs().map(function(ip) { return ip.split('/')[0] }));

				for (var i = 0; i < data[1].length; i++)
					hostnames.push.apply(hostnames, data[1][i].getIP6Addrs().map(function(ip) { return ip.split('/')[0] }));

				var ips = [ '0.0.0.0/0', '::/0' ];

				var dns = [];

				var lan = data[2];
				if (lan) {
					var lanIp = lan.getIPAddr();
					if (lanIp) {
						dns.unshift(lanIp)
					}
				}

				var qrm, qrs, qro;

				qrm = new form.JSONMap({ config: { endpoint: hostnames[0], allowed_ips: ips, addresses: eips, dns_servers: dns } }, null, _('The generated configuration can be imported into a WireGuard client application to set up a connection towards this device.'));
				qrm.parent = parent;

				qrs = qrm.section(form.NamedSection, 'config');

					function handleConfigChange(ev, section_id, value) {
						var code = this.map.findElement('.qr-code'),
						    conf = this.map.findElement('.client-config'),
						    endpoint = this.section.getUIElement(section_id, 'endpoint'),
						    ips = this.section.getUIElement(section_id, 'allowed_ips'),
						    eips = this.section.getUIElement(section_id, 'addresses'),
						    dns = this.section.getUIElement(section_id, 'dns_servers');

					if (this.isValid(section_id)) {
						conf.firstChild.data = configGenerator(endpoint.getValue(), ips.getValue(), eips.getValue(), dns.getValue());
						code.style.opacity = '.5';

						buildSVGQRCode(conf.firstChild.data, code);
					}
				};

				qro = qrs.option(form.Value, 'endpoint', _('Connection endpoint'), _('The public hostname or IP address of this system the peer should connect to. This usually is a static public IP address, a static hostname or a DDNS domain.'));
				qro.datatype = 'or(ipaddr,hostname)';
				hostnames.forEach(function(hostname) { qro.value(hostname) });
				qro.onchange = handleConfigChange;

				qro = qrs.option(form.DynamicList, 'allowed_ips', _('Allowed IPs'), _('IP addresses that are allowed inside the tunnel. The peer will accept tunnelled packets with source IP addresses matching this list and route back packets with matching destination IP.'));
				qro.datatype = 'ipaddr';
				qro.default = ips;
				ips.forEach(function(ip) { qro.value(ip) });
				qro.onchange = handleConfigChange;

				qro = qrs.option(form.DynamicList, 'dns_servers', _('DNS Servers'), _('DNS servers for the remote clients using this tunnel to your openwrt device. Some wireguard clients require this to be set.'));
				qro.datatype = 'ipaddr';
				qro.default = dns;
				qro.onchange = handleConfigChange;

				qro = qrs.option(form.DynamicList, 'addresses', _('Addresses'), _('IP addresses for the peer to use inside the tunnel. Some clients require this setting.'));
				qro.datatype = 'ipaddr';
				qro.default = eips;
				eips.forEach(function(eip) { qro.value(eip) });
				qro.onchange = handleConfigChange;

					qro = qrs.option(form.DummyValue, 'output');
					qro.renderWidget = function() {
						var peer_config = configGenerator(hostnames[0], ips, eips, dns);

						var node = E('div', {
							'class': 'awg-config-export'
						}, [
							E('div', { 'class': 'alert-message warning awg-export-note' }, [
								_('This configuration and QR code contain a private key. Keep them secret.')
							]),
							E('div', {
								'class': 'qr-code'
							}, [
								E('em', { 'class': 'spinning' }, [ _('Generating QR code…') ])
							]),
							E('pre', {
								'class': 'client-config',
								'click': function(ev) {
								var sel = window.getSelection(),
								    range = document.createRange();

								range.selectNodeContents(ev.currentTarget);

								sel.removeAllRanges();
								sel.addRange(range);
								}
							}, [ peer_config ]),
							E('div', { 'class': 'awg-export-actions' }, [
								E('button', {
									'class': 'btn cbi-button',
									'type': 'button',
									'click': function(ev) {
										var button = ev.currentTarget,
										    original = button.textContent,
										    config = node.querySelector('.client-config').textContent;

										return copyText(config).then(function() {
											button.textContent = _('Copied');
											window.setTimeout(function() { button.textContent = original; }, 1500);
										}, function() {
											ui.addNotification(null, E('p', [ _('Unable to copy the configuration.') ]), 'error');
										});
									}
								}, [ _('Copy configuration') ]),
								E('button', {
									'class': 'btn cbi-button',
									'type': 'button',
									'click': function() {
										downloadText(node.querySelector('.client-config').textContent, 'amneziawg-peer.conf');
									}
								}, [ _('Download .conf') ])
							])
						]);

						buildSVGQRCode(peer_config, node.querySelector('.qr-code'));

					return node;
				};

				return qrm.render().then(function(nodes) {
					mapNode.classList.add('hidden');
					mapNode.nextElementSibling.classList.add('hidden');

					headNode.appendChild(E('span', [ ' » ', _('Generate configuration') ]));
					mapNode.parentNode.appendChild(E([], [
						nodes,
						E('div', {
							'class': 'right'
						}, [
							E('button', {
								'class': 'btn',
								'click': function() {
									nodes.parentNode.removeChild(nodes.nextSibling);
									nodes.parentNode.removeChild(nodes);
									mapNode.classList.remove('hidden');
									mapNode.nextSibling.classList.remove('hidden');
									headNode.removeChild(headNode.lastChild);
								}
							}, [ _('Back to peer configuration') ])
						])
					]));

					if (!s.formvalue(s.section, 'listen_port')) {
						nodes.appendChild(E('div', { 'class': 'alert-message' }, [
							E('p', [
								_('No fixed interface listening port defined, peers might not be able to initiate connections to this AmneziaWG instance!')
							])
						]));
					}
				});
			});
		};

		o.cfgvalue = function(section_id, value) {
			var privkey = this.section.cfgvalue(section_id, 'private_key');

			return E('button', {
				'class': 'btn qr-code',
				'style': 'display:inline-flex;align-items:center;gap:.5em',
				'click': ui.createHandlerFn(this, 'handleGenerateQR', section_id),
				'disabled': privkey ? null : ''
			}, [
				Object.assign(E(qrIcon), { style: 'width:22px;height:22px' }),
				_('Generate configuration…')
			]);
		};
	},

	deleteConfiguration: function() {
		uci.sections('network', 'amneziawg_%s'.format(this.sid), function(s) {
			uci.remove('network', s['.name']);
		});
	}
});
