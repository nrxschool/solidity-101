// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const NFTModule = buildModule("NFT", (m) => {
  const name = m.getParameter("name", "NFT");
  const symbol = m.getParameter("symbol", "NFT");

  const nft = m.contract("NFT", [name, symbol]);

  return { nft };
});

module.exports = NFTModule;
