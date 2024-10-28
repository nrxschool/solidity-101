require("@nomicfoundation/hardhat-toolbox");
const dotenv = require("dotenv");

dotenv.config();
const { TESTNET_DEPLOYER, TESTNET_ADMIN, TESTNET_PAUSER, TESTNET_MINTER } =
  process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks: {
    amoy: {
      url: "https://rpc-amoy.polygon.technology",
      accounts: [
        `${TESTNET_DEPLOYER}`,
        `${TESTNET_ADMIN}`,
        `${TESTNET_PAUSER}`,
        `${TESTNET_MINTER}`,
      ],
    },
  },
};
