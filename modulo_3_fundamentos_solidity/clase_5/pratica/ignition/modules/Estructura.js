// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const INITIAL_BALANCE = 100; 

module.exports = buildModule("Estructura", (m) => {
  const initialBalance = m.getParameter("initialBalance", INITIAL_BALANCE);
  const exemploContrato = m.contract("Estrutura", [initialBalance]);

  return { exemploContrato };
});
