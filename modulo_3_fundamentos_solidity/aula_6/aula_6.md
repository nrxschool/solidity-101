# Aula 6: **Variáveis Globais em Solidity**

## Abertura

Olá! Bem-vindo à sexta aula do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos os tipos de dados e a anatomia básica de um contrato Solidity. Hoje, vamos nos aprofundar nas **variáveis globais** em Solidity, que são essenciais para interagir com o ambiente de execução e obter informações contextuais importantes para seus contratos inteligentes. Vamos entender o que são essas variáveis, como usá-las e qual o seu papel no desenvolvimento de contratos eficientes e seguros.

### Programação:

1. Variáveis Globais
2. Categorias de Variáveis Globais
3. Exemplos de Variáveis Globais
4. Utilização em Contratos Inteligentes

---

## 1. Variáveis Globais

- **Definição**: Variáveis pré-definidas fornecidas pelo Solidity que fornecem informações sobre o ambiente de execução no Ethereum.
- **Acesso**: Podem ser acessadas de qualquer função ou parte do contrato inteligente.
- **Uso**: Fornecem dados sobre transações, blocos e propriedades do contrato atual, permitindo que seus contratos interajam de forma dinâmica com a blockchain.

---

## 2. Categorias de Variáveis Globais

1. **Variáveis de Bloco**: Informações sobre o bloco atual na blockchain.
2. **Variáveis de Transação**: Dados específicos da transação em execução.
3. **Variáveis de Contrato**: Informações contextuais do próprio contrato inteligente.

---

## 3. Exemplos de Variáveis Globais

| Variável           | Descrição                                                                                          |
|--------------------|----------------------------------------------------------------------------------------------------|
| `block.number`     | Número do bloco atual.                                                                             |
| `block.timestamp`  | Data e hora do bloco atual (em segundos desde a época Unix).                                       |
| `msg.sender`       | Endereço do remetente da transação atual.                                                          |
| `msg.value`        | Quantidade de Ether enviada com a transação atual (em wei).                                        |
| `tx.origin`        | Endereço da conta inicial que originou a transação (mesmo em chamadas aninhadas).                  |
| `gasleft()`        | Quantidade de gás restante para execução da função atual.                                          |
| `this`             | Endereço do contrato atual.                                                                        |

---

## 4. Utilização em Contratos Inteligentes

O exemplo abaixo ilustra como usar algumas variáveis globais em um contrato Solidity:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract MeuContrato {
    // Armazena o timestamp da última vez que uma função foi chamada
    uint256 public ultimaChamada;

    // Função que registra o timestamp atual na variável 'ultimaChamada'
    function atualizarTimestamp() public {
        ultimaChamada = block.timestamp; // Captura o horário do bloco atual
    }

    // Função que retorna o saldo atual do contrato
    function obterSaldo() public view returns (uint256) {
        return address(this).balance; // Retorna o saldo do próprio contrato
    }
}
```

### Explicação do Código

1. **`block.timestamp`**: Usado para registrar o momento da última chamada da função `atualizarTimestamp`.
2. **`address(this).balance`**: Retorna o saldo de Ether disponível no contrato, utilizando o endereço do próprio contrato (`this`).

---

Essas variáveis globais ajudam a acessar informações contextuais fundamentais para a lógica de contratos inteligentes, como verificar o tempo de execução, identificar remetentes e gerenciar o saldo do contrato.

---

## Conclusão

Nesta aula, exploramos as **variáveis globais** em Solidity, entendendo como elas fornecem informações essenciais sobre o ambiente de execução. Vimos como essas variáveis podem ser utilizadas para criar contratos inteligentes mais dinâmicos e interativos, permitindo que você acesse dados como o endereço do remetente, o timestamp atual, o número do bloco e muito mais. Compreender e utilizar essas variáveis é crucial para o desenvolvimento de contratos eficientes e seguros.

---

## Recapitulação

1. **Variáveis Globais**: São variáveis pré-definidas que fornecem informações sobre o ambiente de execução do Ethereum.
2. **Categorias de Variáveis**:
   - **Variáveis de Bloco**: Informações sobre o bloco atual (e.g., `block.number`, `block.timestamp`).
   - **Variáveis de Transação**: Dados da transação em execução (e.g., `msg.sender`, `msg.value`).
   - **Variáveis de Contrato**: Informações sobre o próprio contrato (e.g., `this`).
3. **Utilização em Contratos**: Aprendemos a usar essas variáveis para registrar timestamps, obter o saldo do contrato e interagir com o ambiente de execução.

---

## Lição de casa

Crie um contrato que registre o endereço de quem chamou uma função usando `msg.sender`.Implemente um contrato que restrinja o acesso a uma função para que só possa ser chamada após um determinado tempo, utilizando `block.timestamp`.

---

## Próxima aula

Na próxima aula, vamos explorar modificadores de variáveis.

---