// Esta configuración utiliza Hardhat Ignition para gestionar implementaciones de contratos inteligentes.
// Aprende más en https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("Ejemplo", (m) => {
  const lock = m.contract("EjemploSeguro");

  return { lock };
});
