# Aula 2: **Projeto Prático: Crie Seus Próprios NFTs (ERC-721)**

## Abertura

Bem-vindo à Aula 2! Hoje, vamos colocar em prática o que aprendemos sobre o padrão **ERC-721** e criar um **NFT** (Non-Fungible Token) usando **Hardhat** e **OpenZeppelin**. Os NFTs são únicos e não fungíveis, o que significa que cada token possui uma identidade própria. Nesta aula, exploraremos os conceitos e as etapas práticas para criar seu próprio contrato de NFT.

### Programação:

1. Introdução aos NFTs e ao padrão ERC-721
2. Criando um contrato ERC-721 com Hardhat e OpenZeppelin
3. Passo a Passo para Desenvolver, Compilar e Implantar o Contrato

---

## 1. Introdução aos NFTs (ERC-721)

### Revisão do Conceito de NFTs

- **Definição**: NFTs são tokens únicos e não intercambiáveis na blockchain, representando itens como arte digital, colecionáveis, e ativos de jogos.
- **Padrão ERC-721**:
  - Define um conjunto de funções para criar, transferir e gerenciar NFTs.
  - **Casos de Uso**: Arte digital, colecionáveis, terrenos e ativos em jogos, itens do metaverso, entre outros.

---

## 2. Criando um Contrato ERC-721 com Hardhat

Para este projeto, utilizaremos o **Hardhat** para configurar e desenvolver o contrato, e a **biblioteca OpenZeppelin** para facilitar a criação do padrão ERC-721 com funcionalidades seguras.

---

## 3. Passo a Passo do Projeto

### Passo 1: Criar um Projeto Hardhat

Primeiro, vamos criar um novo projeto Hardhat e inicializá-lo:

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

---

### Passo 2: Instalar a Biblioteca OpenZeppelin

Instalamos o pacote OpenZeppelin para acessar a implementação do padrão ERC-721:

```bash
npm install @openzeppelin/contracts
```

---

### Passo 3: Criar o Contrato `MeuNFT.sol`

Crie um arquivo chamado `MeuNFT.sol` na pasta `contracts/` com o seguinte código:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MeuNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MeuNFT", "MNFT") {}

    function mint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
```

- **Descrição do Contrato**:
  - **`ERC721`**: A classe base para nosso NFT, fornecida pela OpenZeppelin.
  - **Counters**: Gerencia IDs únicos para cada NFT criado.
  - **`mint`**: Função pública para cunhar novos NFTs e associá-los ao endereço especificado.

---

### Passo 4: Compilar o Contrato

Compile o contrato para verificar se o código está correto e pronto para ser implantado.

```bash
npx hardhat compile
```

---

### Passo 5: Criar um Módulo no Ignition para o Deploy (`MeuNFT.js`)

Configure o script de deploy utilizando o Hardhat Ignition:

```javascript
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("MeuNFT", (m) => {
  const meuNFT = m.contract("MeuNFT");

  return { meuNFT };
});
```

---

### Passo 6: Fazer o Deploy na Testnet (ex: Goerli)

Execute o deploy em um nó local para teste. Se desejar, use uma rede de teste como Goerli:

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

Nesta aula, construímos um contrato ERC-721 para criar e gerenciar NFTs. Exploramos o conceito de NFTs, as etapas para configurar o projeto com Hardhat, a utilização do OpenZeppelin para implementar o padrão ERC-721 e as etapas de compilação e deploy. Esse projeto prático demonstra o poder e a flexibilidade dos contratos inteligentes e como os NFTs podem ser criados e gerenciados na blockchain Ethereum.

---

## Recapitulação

1. **Introdução aos NFTs e ERC-721**:
   - Revisão do conceito de NFTs e seu uso no mundo blockchain.
2. **Passo a Passo para Criar um Projeto ERC-721**:
   - Configuração do Hardhat, uso da OpenZeppelin e desenvolvimento do contrato `MeuNFT`.
3. **Deploy**:
   - Compilação e deploy do contrato em um nó local para testes.

---

## Lição de Casa

Cunhe seu primeiro NFT na testnet! Modifique o contrato para incluir um nome exclusivo e uma descrição para cada NFT cunhado, registrando esses dados na blockchain.

---

## Próxima Aula

Na próxima aula, exploraremos o padrão ERC-1155 e como ele permite criar tokens fungíveis e não fungíveis em um único contrato.

---