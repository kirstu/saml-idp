const R = require("ramda");
const defaultConf = require("./config.defaults.js");

const getLocalConfig = () => {
  try {
    return require("./config.local.js");
  } catch (e) {
    console.log(
      'Local config not found. You should add one to "config.local.js"'
    );
    return {};
  }
};

module.exports = R.mergeDeepRight(defaultConf, getLocalConfig());
