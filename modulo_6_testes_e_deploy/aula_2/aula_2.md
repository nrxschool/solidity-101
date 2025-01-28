# Aula 2: **Ecossistema Ethereum: ethers.js e web3.js**

## Abertura

Bem-vindo à aula 2! Hoje vamos explorar o **ecossistema Ethereum** e aprender a usar as bibliotecas JavaScript **ethers.js** e **web3.js** para interagir com a blockchain. Essas ferramentas são essenciais para qualquer desenvolvedor Ethereum, facilitando a comunicação com contratos inteligentes e a realização de transações na rede.

### Programação

1. O Ecossistema Ethereum
2. Interagindo com a Blockchain com ethers.js e web3.js

---

## 1. O Ecossistema Ethereum

### Visão Geral

O ecossistema Ethereum é composto por diversas ferramentas, bibliotecas, padrões e aplicações, que oferecem uma estrutura para o desenvolvimento de contratos inteligentes e dApps. Vamos explorar os componentes principais que tornam o desenvolvimento no Ethereum um processo mais integrado e eficiente.

### Componentes Principais

- **Clientes Ethereum**: Softwares como **Geth** e **Besu** que permitem a conexão à rede Ethereum e o processamento de transações.
- **Carteiras**: Ferramentas como **MetaMask** e **Ledger** que gerenciam chaves privadas e interagem com contratos.
- **Block Explorers**: Plataformas como **Etherscan** que permitem visualizar detalhes de transações, blocos e contas.
- **Bibliotecas**: Ferramentas como **ethers.js** e **web3.js** que permitem aos desenvolvedores interagir com a blockchain usando JavaScript.
- **Padrões**: Padrões como **ERC-20** e **ERC-721** garantem que diferentes contratos sigam convenções específicas, permitindo interoperabilidade.
- **Aplicações**: **dApps**, **DeFi**, **NFTs**, **DAOs** e outras aplicações que utilizam contratos inteligentes para oferecer serviços descentralizados.

---

## 2. Interagindo com a Blockchain

### ethers.js e web3.js

Essas bibliotecas JavaScript são as principais ferramentas para conectar-se à blockchain e interagir com contratos. Vamos entender o papel de cada uma:

- **ethers.js**: Uma biblioteca leve e flexível, popular pela sua integração com wallets como MetaMask e facilidade de uso em dApps.
- **web3.js**: Amplamente usada para interagir com contratos Ethereum e realizar transações.

### Principais Funcionalidades

Ambas as bibliotecas permitem realizar ações como:

- **Conectar-se a diferentes redes**: Mainnet, Testnets, ou redes locais.
- **Assinar e enviar transações**: Realizar transferências de Ether ou chamadas para contratos inteligentes.
- **Interagir com contratos**: Chamar funções de contratos e obter dados.
- **Escutar eventos**: Receber notificações sobre transações e outras atividades específicas.

---

## Exemplo Prático com ethers.js

### Configuração do Ambiente

1. **Configurar o provedor**: Crie uma conexão com a rede Ethereum (usando um serviço como Infura ou Alchemy).
2. **Instanciar o contrato**: Use o endereço do contrato e a ABI para criar uma instância do contrato.
3. **Chamar uma função**: Realize uma chamada de leitura ou escrita em um contrato.

### Exemplo de Código

```javascript
// Importando a biblioteca ethers.js
const { ethers } = require("ethers");

// Configurando o provedor (utilize um endpoint da mainnet/testnet, como Infura ou Alchemy)
const provider = new ethers.providers.JsonRpcProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID");

// Configurando a ABI e o endereço do contrato
const enderecoContrato = "0x1234567890abcdef1234567890abcdef12345678";
const abiContrato = [
    // ABI do contrato (array com funções e eventos)
    "function minhaFuncao() public view returns (string)"
];

// Criando uma instância do contrato
const contrato = new ethers.Contract(enderecoContrato, abiContrato, provider);

async function main() {
    try {
        // Chamando uma função do contrato
        const resultado = await contrato.minhaFuncao();
        console.log("Resultado:", resultado);
    } catch (error) {
        console.error("Erro ao chamar a função:", error);
    }
}

main();
```

- **Descrição**:
  - **Provedor**: Conecte-se a uma rede (usando uma API JSON-RPC).
  - **Contrato**: Use o endereço do contrato e a ABI para configurar o acesso.
  - **Função**: Chame `minhaFuncao()` para obter dados do contrato.

### Notas

- **Segurança**: Nunca compartilhe sua chave privada. Para operações de transação, use uma carteira segura.
- **Taxa de Gás**: Sempre verifique o custo de gás ao interagir com funções complexas ou ao enviar transações para a mainnet.

---

## Conclusão

Nesta aula, exploramos o **ecossistema Ethereum** e as principais ferramentas de desenvolvimento, como **ethers.js** e **web3.js**. Essas bibliotecas facilitam a interação com contratos inteligentes, permitindo que desenvolvedores integrem suas aplicações com a blockchain Ethereum de maneira eficiente e segura.

---

## Recapitulação

1. **Ecossistema Ethereum**:
   - Composto por clientes, carteiras, exploradores, padrões e dApps.
2. **ethers.js e web3.js**:
   - Ferramentas essenciais para conexão e interação com a blockchain.
3. **Exemplo Prático**:
   - Criamos um exemplo com ethers.js, onde configuramos um provedor, instanciamos um contrato e chamamos uma função.

---

## Lição de Casa

1. Configure uma conta no Infura ou Alchemy para obter uma API Key.
2. Implemente um código para chamar uma função de um contrato de token ERC-20 (como `balanceOf`) usando ethers.js e exiba o saldo de uma conta.

---

## Próxima Aula

Na próxima aula, vamos aprender sobre **eventos e como escutar e reagir a eles em contratos inteligentes**.

---