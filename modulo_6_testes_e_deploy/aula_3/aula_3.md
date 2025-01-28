# Aula 3: **Provedores RPC: Infura e Alchemy**

## Abertura

Bem-vindo à Aula 3! Hoje vamos falar sobre os **provedores RPC** e como eles são fundamentais para conectar suas aplicações à blockchain Ethereum de forma segura e eficiente. Aprenderemos sobre o funcionamento dos provedores RPC e exploraremos dois dos provedores mais populares: **Infura** e **Alchemy**.

### Programação:

1. O que é um Provedor RPC?
2. Por que usar um Provedor RPC?
3. Infura
4. Alchemy

---

## 1. O que é um Provedor RPC?

### Visão Geral

- **RPC (Remote Procedure Call)** é um protocolo que permite que uma aplicação envie comandos e receba respostas da blockchain Ethereum.
- **Provedor RPC**: Fornece um ponto de acesso (endpoint) para a comunicação com a rede Ethereum, gerenciando as interações com um nó Ethereum, sem necessidade de você executar seu próprio nó.
  
---

## 2. Por que usar um Provedor RPC?

### Vantagens do Uso de Provedores RPC

- **Simplicidade**: Elimina a necessidade de configurar e manter um nó próprio, facilitando o desenvolvimento.
- **Escalabilidade**: Provedores RPC oferecem infraestrutura robusta para lidar com um grande volume de requests.
- **Confiabilidade**: A infraestrutura de provedores como Infura e Alchemy é altamente disponível e otimizada para performance.
- **Segurança**: Provedores implementam protocolos de segurança avançados para proteger suas transações e dados.

---

## 3. Infura

### Características do Infura

- **Popularidade**: Um dos provedores RPC mais usados na comunidade Ethereum.
- **Facilidade de Integração**: Projetado para funcionar facilmente com bibliotecas como **ethers.js** e **web3.js**.
- **Planos de Uso**:
  - **Plano Gratuito**: Inclui uma quantidade limitada de requisições por mês.
  - **Planos Pagos**: Oferecem suporte para um volume maior de requests e funcionalidades adicionais.

### Exemplo de Conexão com Infura usando ethers.js

```javascript
const { ethers } = require("ethers");

// Conectando à rede Ethereum com Infura
const provider = new ethers.providers.JsonRpcProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID");

// A partir daqui, você pode usar o provider para interagir com a blockchain Ethereum
```

---

## 4. Alchemy

### Características do Alchemy

- **Foco em Desenvolvedores**: Alchemy oferece ferramentas exclusivas e APIs avançadas para simplificar o desenvolvimento de dApps.
- **Recursos Adicionais**:
  - **Monitoramento de Transações**: Permite rastrear e monitorar transações em tempo real.
  - **APIs para NFTs**: Ferramentas avançadas para integração com tokens não fungíveis.
  - **Webhooks e Alertas**: Notificações e alertas automatizados para eventos de blockchain.
- **Planos de Uso**:
  - **Plano Gratuito**: Inclui uma quantidade limitada de requests mensais.
  - **Planos Pagos**: Oferecem recursos adicionais e suporte para maior volume.

### Exemplo de Conexão com Alchemy usando ethers.js

```javascript
const { ethers } = require("ethers");

// Conectando à rede Ethereum com Alchemy
const provider = new ethers.providers.JsonRpcProvider("https://eth-mainnet.alchemyapi.io/v2/YOUR_ALCHEMY_API_KEY");

// A partir daqui, você pode usar o provider para interagir com a blockchain Ethereum
```

---

## Conclusão

Nesta aula, exploramos os provedores RPC, como eles simplificam o acesso à blockchain Ethereum e garantem uma infraestrutura de alta disponibilidade e segurança. Conhecemos o Infura e o Alchemy, dois provedores populares que oferecem ferramentas e recursos para facilitar o desenvolvimento de dApps e outras soluções baseadas em blockchain.

---

## Recapitulação

1. **Provedores RPC**: São a ponte entre sua aplicação e a blockchain, facilitando o desenvolvimento.
2. **Por que Usar Provedores RPC**: Provedores como Infura e Alchemy simplificam a conectividade com a Ethereum sem a necessidade de gerenciar um nó próprio.
3. **Infura e Alchemy**: Ambos oferecem planos gratuitos, com opções pagas para maior volume e funcionalidades adicionais.

---

## Lição de Casa

Configure uma conta gratuita no Infura e no Alchemy. Em seguida, tente estabelecer uma conexão com a rede Ethereum usando cada provedor e execute uma função simples, como `eth_blockNumber`, para verificar a comunicação.

---

## Próxima Aula

Na próxima aula, vamos aprender a integrar contratos com bibliotecas JavaScript para interações mais avançadas e automação de tarefas na blockchain.

---