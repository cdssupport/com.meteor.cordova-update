
var argscheck = require('cordova/argscheck'),
exec = require('cordova/exec');

var corhttpd_exports = {};

corhttpd_exports.startServing = function(options, success, error) {
  var defaults = {
    'www_root': '',
    'cordovajs_root': null
  };

  // Merge optional settings into defaults.
  for (var key in defaults) {
    if (typeof options[key] !== 'undefined') {
      defaults[key] = options[key];
    }
  }

  exec(success, error, "METEORCordovaUpdate", "startServer", [ defaults['www_root'], defaults['cordovajs_root'] ]);
};

corhttpd_exports.setLocalPath = function (path, success, error) {
  exec(success, error, "METEORCordovaUpdate", "setLocalPath", [path]);
};

module.exports = corhttpd_exports;
