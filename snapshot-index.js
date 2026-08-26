const axios = require('axios');
const cheerio = require('cheerio');
const core = require('@actions/core');

const filterTargets = parseList(process.argv[2]);
const filterSubtargets = parseList(process.argv[3]);
const snapshotRoot = 'https://downloads.openwrt.org/snapshots/targets/';

function parseList(value = '') {
  return value.split(',').map(item => item.trim()).filter(Boolean);
}

function sanitizeTagPart(value) {
  return value.replace(/[^A-Za-z0-9._-]/g, '-');
}

async function fetchText(url) {
  const { data } = await axios.get(url, { responseType: 'text' });
  return data;
}

async function fetchHTML(url) {
  return cheerio.load(await fetchText(url));
}

function directoryNames($) {
  const names = [];

  $('table tr td.n a').each((_, element) => {
    const href = $(element).attr('href');
    if (href && !href.startsWith('/') && href !== '../' && href.endsWith('/')) {
      names.push(href.slice(0, -1));
    }
  });

  return names;
}

async function getTargets() {
  if (filterTargets.length > 0) {
    return filterTargets;
  }

  return directoryNames(await fetchHTML(snapshotRoot));
}

async function getSubtargets(target) {
  const available = directoryNames(await fetchHTML(`${snapshotRoot}${target}/`));
  if (filterSubtargets.length === 0) {
    return available;
  }

  return available.filter(subtarget => filterSubtargets.includes(subtarget));
}

async function getLatestVermagic(target, subtarget) {
  const $ = await fetchHTML(`${snapshotRoot}${target}/${subtarget}/kmods/`);
  const builds = [];

  $('table tr').each((_, row) => {
    const href = $(row).find('td.n a').attr('href');
    if (!href || href.startsWith('/') || href === '../' || !href.endsWith('/')) {
      return;
    }

    const modifiedText = $(row).find('td.d').text().trim();
    const modifiedAt = Date.parse(modifiedText);
    builds.push({
      vermagic: href.slice(0, -1),
      modifiedAt: Number.isNaN(modifiedAt) ? 0 : modifiedAt,
    });
  });

  builds.sort((a, b) => b.modifiedAt - a.modifiedAt || b.vermagic.localeCompare(a.vermagic));
  if (builds.length === 0) {
    throw new Error(`No kmod ABI found for ${target}/${subtarget}`);
  }

  return builds[0].vermagic;
}

async function getBuildDetails(target, subtarget) {
  const baseUrl = `${snapshotRoot}${target}/${subtarget}/`;
  const $ = await fetchHTML(baseUrl);
  let sdkFile = '';

  $('table tr td.n a').each((_, element) => {
    const href = $(element).attr('href') || '';
    if (/^openwrt-sdk-.*\.Linux-x86_64\.tar\.(xz|zst)$/.test(href)) {
      sdkFile = href;
      return false;
    }
  });

  if (!sdkFile) {
    throw new Error(`Snapshot SDK not found for ${target}/${subtarget}`);
  }

  const revision = (await fetchText(`${baseUrl}version.buildinfo`)).trim();
  if (!revision) {
    throw new Error(`Snapshot revision not found for ${target}/${subtarget}`);
  }

  const { data: packageIndex } = await axios.get(`${baseUrl}packages/index.json`, {
    responseType: 'json',
  });
  const pkgarch = packageIndex.architecture || '';
  if (!pkgarch) {
    throw new Error(`Package architecture not found for ${target}/${subtarget}`);
  }

  const vermagic = await getLatestVermagic(target, subtarget);
  const safeRevision = sanitizeTagPart(revision);

  return {
    target,
    subtarget,
    pkgarch,
    revision,
    vermagic,
    sdkFile,
    sdkUrl: `${baseUrl}${sdkFile}`,
    releaseTag: `snapshot-${safeRevision}`,
    artifactPostfix: `snapshot-${safeRevision}_${sanitizeTagPart(vermagic)}_${pkgarch}_${target}_${subtarget}`,
  };
}

async function main() {
  try {
    if ((filterTargets.length === 0) !== (filterSubtargets.length === 0)) {
      throw new Error('Targets and subtargets must either both be set or both be empty');
    }

    const configs = [];
    for (const target of await getTargets()) {
      let subtargets;
      try {
        subtargets = await getSubtargets(target);
      } catch (error) {
        core.warning(`Skipping target ${target}: ${error.message}`);
        continue;
      }

      for (const subtarget of subtargets) {
        try {
          configs.push(await getBuildDetails(target, subtarget));
        } catch (error) {
          core.warning(`Skipping ${target}/${subtarget}: ${error.message}`);
        }
      }
    }

    if (configs.length === 0) {
      throw new Error('No matching Snapshot target/subtarget pairs found');
    }

    core.setOutput('job-config', JSON.stringify(configs));
  } catch (error) {
    core.setFailed(error.message);
  }
}

main();
