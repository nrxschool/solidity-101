# Aula 3.6: Variáveis Globais em Solidity

**Objetivo**: Conhecer e aprender a utilizar as variáveis globais fornecidas por Solidity para interagir com o ambiente de execução e obter informações contextuais.

---

## Conteúdo

### Variáveis Globais

- São variáveis pré-definidas pela linguagem Solidity.
- Fornecem informações sobre a transação, o bloco atual e outras propriedades do ambiente de execução.
- Podem ser acessadas de qualquer lugar dentro de um contrato inteligente.

### Categorias de Variáveis Globais

1. **Variáveis de Bloco**: Fornecem informações sobre o bloco atual da blockchain.
2. **Variáveis de Transação**: Fornecem informações sobre a transação que está sendo executada.
3. **Variáveis de Contrato**: Fornecem informações sobre o próprio contrato inteligente.

### Exemplos de Variáveis Globais

| Variável         | Descrição                                                                                           |
|------------------|-----------------------------------------------------------------------------------------------------|
| `block.number`   | Número do bloco atual.                                                                              |
| `block.timestamp`| Timestamp do bloco atual (em segundos desde a época Unix).                                          |
| `msg.sender`     | Endereço do remetente da transação atual.                                                           |
| `msg.value`      | Quantidade de Ether enviada com a transação atual (em wei).                                         |
| `tx.origin`      | Endereço da conta que originou a transação (EOA inicial, mesmo em chamadas aninhadas).              |
| `gasleft()`      | Quantidade de gás restante para a execução da função atual.                                         |
| `this`           | Endereço do contrato atual.                                                                         |

---

## Utilização em Contratos Inteligentes

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract MeuContrato {
    // Armazena o timestamp da última vez que uma função foi chamada
    uint256 public ultimaChamada;

    // Função que registra o timestamp atual na variável 'ultimaChamada'
    function atualizarTimestamp() public {
        ultimaChamada = block.timestamp;
    }

    // Função que retorna o saldo atual do contrato
    function obterSaldo() public view returns (uint256) {
        return address(this).balance;
    }
}
```
