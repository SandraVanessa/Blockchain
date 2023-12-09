// 2_deploy_contracts.js
const ProductAuthenticator = artifacts.require("ProductAuthenticator");

module.exports = function (deployer) {
  deployer.deploy(ProductAuthenticator);
};
