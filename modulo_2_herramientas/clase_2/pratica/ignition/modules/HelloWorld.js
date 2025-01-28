const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

/*
 - Puedes crear varios módulos, pero cada uno debe tener un ID único.
 - Para desplegar tu módulo necesitas exportarlo.
 - El método buildModule recibe dos parámetros:
   - Un identificador del módulo, que debe ser único.
   - Una función de callback que recibe un objeto `m` como argumento.
     - Este objeto `m` es una instancia de `ModuleBuilder`, que proporciona métodos para definir y configurar las instancias de tus contratos inteligentes.
*/

module.exports = buildModule("HelloWorld" /*identificador del módulo*/, (m) => {
  // `m.contract("HelloWorld")` crea una instancia del contrato "HelloWorld" y la asigna a la variable `hw`.
  // Este método no implementa el contrato en la red, solo crea una representación interna del mismo.
  const hw = m.contract("HelloWorld");

  // Retornamos un objeto que contiene la instancia del contrato `hw`.
  // Esto hace que el contrato sea accesible para otros módulos y pruebas.
  m.call(hw, "updateMessage", ["¡Hola mundo!"]);
  m.call(hw, "helloWorld");

  return { hw };
});

// npx hardhat ignition visualize ignition/modules/HelloWorld.js 
// npx hardhat ignition deploy ignition/modules/HelloWorld.js --network localhost
