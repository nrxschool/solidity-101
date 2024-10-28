## Aula 7.2: Projeto Prático: Crie seus próprios NFTs (ERC-721)

**Objetivo:**  Construir um contrato ERC-721 para criar e gerenciar seus próprios NFTs, utilizando o Hardhat para desenvolvimento e deploy.

**Conteúdo:**

- **Introdução aos NFTs (ERC-721):**
    - Revisão do conceito de NFTs: tokens únicos e não fungíveis.
    - Padrão ERC-721: define as funções básicas para criar, transferir e gerenciar NFTs.
    - Casos de uso: arte digital, colecionáveis, jogos, metaverso, etc.

- **Criando um Contrato ERC-721 com Hardhat:**
    - **Passo 1: Criar um projeto Hardhat:**

    ```bash
    npm init -y
    npm install --save-dev hardhat
    npx hardhat init
    ```

    - **Passo 2: Instalar a biblioteca OpenZeppelin:**

    ```bash
    npm install @openzeppelin/contracts
    ```

    - **Passo 3: Criar o contrato `MeuNFT.sol`:**

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

    - **Passo 4: Compilar o contrato:**

    ```bash
    npx hardhat compile
    ```

    - **Passo 5: Criar um módulo no ignition `MeuNFT.js`:**

    ```javascript
    const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

    module.exports = buildModule("MeuNFT", (m) => {
      const meuNFT = m.contract("MeuNFT"); 

      return { meuNFT };
    });
    ```

    - **Passo 6: Fazer o deploy na testnet (ex: Goerli):**

    ```bash
    npx hardhat node
    npx hardhat ignition deploy --network localhost
    ```
