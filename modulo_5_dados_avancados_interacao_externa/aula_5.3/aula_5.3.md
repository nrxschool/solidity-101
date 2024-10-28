## Aula 5.3: `virtual` e `override`: Herança e Polimorfismo

**Objetivo:**  Dominar o uso de funções `virtual` e `override` em Solidity para implementar herança e polimorfismo em contratos inteligentes.

**Conteúdo:**

- **Herança:**
    - Permite criar novos contratos (contratos filhos) que herdam propriedades e comportamentos de contratos existentes (contratos pais).
    - Promove a reutilização de código e a criação de hierarquias de contratos.
    - Palavra-chave `is`: `contract Filho is Pai { ... }`

- **Polimorfismo:**
    - Permite que funções com o mesmo nome tenham diferentes implementações em contratos diferentes.
    - Funções `virtual` e `override` são usadas para implementar o polimorfismo.

- **Funções `virtual`:**
    - Declaradas no contrato pai.
    - Indicam que a função pode ser sobrescrita (overridden) pelos contratos filhos.
    - Palavra-chave `virtual`: `function minhaFuncao() public virtual { ... }`

- **Funções `override`:**
    - Declaradas nos contratos filhos.
    - Sobrescrevem a implementação da função `virtual` do contrato pai.
    - Palavra-chave `override`: `function minhaFuncao() public override { ... }`

- **Exemplo:**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Animal {
    function som() public virtual pure returns (string memory) {
        return "Som genérico de animal";
    }
}

contract Cachorro is Animal {
    function som() public override pure returns (string memory) {
        return "Au au!";
    }
}
```

- **Vantagens da Herança e Polimorfismo:**
    - Reutilização de código
    - Extensibilidade
    - Manutenibilidade
    - Flexibilidade
