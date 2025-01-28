// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("EjemploToken", (m) => {
  const lock = m.contract("EjemploToken")

  return { lock };
});
