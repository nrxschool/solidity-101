require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks: {
    amoy_polygon: {
      url: "https://rpc-amoy.polygon.technology",
      accounts: ['f91f55bb388df7e8f980428a3d36777d45d164265c64ba15b300eb18f95d4b73']
    }
  }
};
