// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const NWCabonModule = buildModule("Token", (m) => {
  const name = m.getParameter("name", "Token");
  const symbol = m.getParameter("symbol", "T");

  const nwCarbon = m.contract("Token", [name, symbol]);

  return { nwCarbon };
});

export default NWCabonModule;