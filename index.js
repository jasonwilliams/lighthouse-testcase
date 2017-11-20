const log = require('lighthouse-logger');
const lighthouse = require('lighthouse');
const chromeLauncher = require('chrome-launcher');

function launchChromeAndRunLighthouse(url, flags = {}, config = null) {
  return chromeLauncher.launch().then(chrome => {
    flags.port = chrome.port;
    return lighthouse(url, flags, config).then(results =>
      chrome.kill().then(() => results));
    });
}

const flags = {logLevel: 'verbose', output: 'json'};
log.setLevel(flags.logLevel);

launchChromeAndRunLighthouse('https://www.google.co.uk', flags).then(results => {
  console.log(results);
}, err => {
  console.log(err);
})
