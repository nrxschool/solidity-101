const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

/*
 - Você pode criar vários módulos, porém cada 1 tem de ter 1 ID diferente 
 - Para deployar seu módulo você precisa exportá-lo
 - O buildModule recebe dois parâmetros:
   - Um identificador do módulo, que deve ser único.
   - Uma função de callback que recebe um objeto `m` como argumento.
     - Este objeto `m` é uma instância de `ModuleBuilder`, que fornece métodos para definir e configurar as instâncias de seus contratos inteligentes.
*/

module.exports = buildModule("HelloWorld" /*identificador do módulo*/, (m) => {
  // `m.contract("HelloWorld")` cria uma instância do contrato "HelloWorld" e a atribui à variável `hw`.
  // Este método não implanta o contrato na rede, apenas cria uma representação interna dele.
  const hw = m.contract("HelloWorld");

  // Retornamos um objeto contendo a instância do contrato `hw`.
  // Isso torna o contrato acessível a outros módulos e testes.
  m.call(hw, "updateMessage", ["Olá mundão!"])
  m.call(hw, "helloWorld")

  return { hw };
});

// npx hardhat ignition visualize ignition/modules/HelloWorld.js 

