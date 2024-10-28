## Aula 6.2: Ecossistema Ethereum: ethers.js e web3.js

**Objetivo:**  Conhecer o ecossistema Ethereum e aprender a interagir com a blockchain usando as bibliotecas JavaScript ethers.js e web3.js.

**Conteúdo:**

- **Ecossistema Ethereum:**
    - Um conjunto de ferramentas, bibliotecas, padrões e aplicações que compõem o mundo do desenvolvimento Ethereum.
    - Componentes principais:
        - **Clientes Ethereum:** Softwares que se conectam à rede Ethereum (ex: Geth, Besu).
        - **Carteiras:** Armazenam e gerenciam chaves privadas (ex: MetaMask, Ledger).
        - **Block Explorers:** Permitem visualizar transações, blocos e contas (ex: Etherscan).
        - **Bibliotecas:** Facilitam o desenvolvimento de aplicações descentralizadas (ex: ethers.js, web3.js).
        - **Padrões:** Garantem a interoperabilidade entre contratos (ex: ERC-20, ERC-721).
        - **Aplicações:** dApps, DeFi, NFTs, DAOs, etc.

- **Interagindo com a Blockchain:**
    - **ethers.js e web3.js:**
        - Bibliotecas JavaScript para interagir com a blockchain Ethereum.
        - Permite:
            - Conectar a diferentes redes
            - Assinar transações
            - Interagir com contratos inteligentes
            - Escutar eventos

**Código (Exemplo com ethers.js):**

```javascript
const { ethers } = require("ethers");

// Conectar à rede Ethereum
const provider = new ethers.providers.JsonRpcProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID");

// Criar uma instância do contrato
const contrato = new ethers.Contract(enderecoContrato, abiContrato, provider);

// Chamar uma função do contrato
const resultado = await contrato.minhaFuncao();

console.log(resultado);
```