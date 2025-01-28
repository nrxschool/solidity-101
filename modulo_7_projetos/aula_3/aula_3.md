# Aula 3: **Projeto Prático: Crie Seu Próprio Token ERC-20**

## Abertura

Bem-vindo à Aula 3! Hoje, vamos aprender a criar um token **ERC-20** — um dos padrões mais populares na blockchain Ethereum, usado para criar tokens fungíveis. Tokens ERC-20 são amplamente aplicáveis, desde criptomoedas até sistemas de pontos em jogos e recompensas. Vamos entender como construir, configurar e implantar um contrato ERC-20 usando **Hardhat** e **OpenZeppelin**.

### Programação:

1. Introdução ao Padrão ERC-20
2. Criando um Contrato ERC-20 com Hardhat e OpenZeppelin
3. Passo a Passo para Desenvolver, Compilar e Implantar o Contrato

---

## 1. Introdução ao Padrão ERC-20

### O Que é o Padrão ERC-20?

- **Definição**: ERC-20 é um padrão para criar tokens fungíveis na Ethereum. Cada unidade do token é idêntica à outra, semelhante às moedas tradicionais.
- **Funções Básicas do ERC-20**:
  - **`totalSupply`**: Retorna a quantidade total de tokens.
  - **`balanceOf`**: Retorna o saldo de tokens de um endereço.
  - **`transfer`**: Transfere tokens de um endereço para outro.
  - **`approve` e `transferFrom`**: Permitem que endereços autorizados gastem tokens em nome de outros.
  - **`allowance`**: Consulta o valor restante que um endereço pode gastar em nome de outro.
- **Casos de Uso**:
  - Criação de criptomoedas.
  - Pontos de recompensa.
  - Representação de ativos e outros recursos fungíveis.

---

## 2. Criando um Contrato ERC-20 com Hardhat

Para este projeto, usaremos **Hardhat** para configurar o ambiente de desenvolvimento e a biblioteca **OpenZeppelin** para implementar o padrão ERC-20 de forma segura.

---

## 3. Passo a Passo do Projeto

### Passo 1: Criar um Projeto Hardhat

Inicialize um novo projeto Hardhat:

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

---

### Passo 2: Instalar a Biblioteca OpenZeppelin

Instale a biblioteca **OpenZeppelin** para usar a implementação do padrão ERC-20:

```bash
npm install @openzeppelin/contracts
```

---

### Passo 3: Criar o Contrato `MeuToken.sol`

Crie um arquivo chamado `MeuToken.sol` na pasta `contracts/` com o código abaixo:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MeuToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MeuToken", "MTK") {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }
}
```

- **Descrição do Contrato**:
  - **ERC20**: Usamos a implementação padrão de OpenZeppelin para o ERC-20.
  - **Construtor**: Recebe o fornecimento inicial de tokens e os cunha diretamente para o criador do contrato.
  - **Nome e Símbolo**: Nomeamos o token como "MeuToken" e usamos "MTK" como seu símbolo.

---

### Passo 4: Compilar o Contrato

Compile o contrato para verificar se o código está correto:

```bash
npx hardhat compile
```

---

### Passo 5: Criar um Módulo no Ignition para o Deploy (`MeuToken.js`)

Configure o deploy usando o Hardhat Ignition:

```javascript
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("MeuToken", (m) => {
  const initialSupply = ethers.parseEther("1000000"); // Fornecimento inicial de 1.000.000 de tokens
  const meuToken = m.contract("MeuToken", [initialSupply]);

  return { meuToken };
});
```

---

### Passo 6: Fazer o Deploy na Testnet (ex: Goerli)

Execute o deploy em um nó local para teste ou em uma testnet:

1. Inicie um nó local com Hardhat:

   ```bash
   npx hardhat node
   ```

2. Execute o deploy usando o Hardhat Ignition:

   ```bash
   npx hardhat ignition deploy --network localhost
   ```

---

## Conclusão

Hoje construímos um contrato ERC-20 que permite criar e distribuir um token fungível. Exploramos o padrão ERC-20, as funções essenciais e as etapas práticas para desenvolver e implantar o contrato usando Hardhat e OpenZeppelin. Esse projeto prático demonstra como criar tokens personalizados na blockchain Ethereum.

---

## Recapitulação

1. **Padrão ERC-20**:
   - Funções essenciais e casos de uso para tokens fungíveis.
2. **Passo a Passo para Criar o Projeto**:
   - Configuração do Hardhat e uso do OpenZeppelin para implementar o padrão ERC-20.
3. **Deploy do Token**:
   - Compilação e deploy do contrato em um nó local para testes.

---

## Lição de Casa

Implemente uma função chamada `burn` em seu contrato ERC-20 que permita que os tokens sejam permanentemente destruídos. Teste essa funcionalidade em um ambiente de desenvolvimento local.

---

## Próxima Aula

Na próxima aula, exploraremos o **padrão ERC-1155** para criar tokens fungíveis e não fungíveis em um único contrato.

---