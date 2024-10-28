## Aula 6.3: Provedores RPC: Infura e Alchemy

**Objetivo:** Entender o que são provedores RPC e como usar Infura e Alchemy para conectar suas aplicações à blockchain Ethereum.

**Conteúdo:**

- **O que é um Provedor RPC?**
    - RPC (Remote Procedure Call) é um protocolo que permite que aplicações se comuniquem com a blockchain Ethereum.
    - Um provedor RPC fornece um ponto de acesso (endpoint) para interagir com a rede Ethereum.
    - Ele lida com a complexidade de gerenciar um nó Ethereum, permitindo que você se concentre no desenvolvimento da sua aplicação.

- **Por que usar um Provedor RPC?**
    - **Simplicidade:** Você não precisa executar seu próprio nó Ethereum.
    - **Escalabilidade:** Provedores RPC oferecem infraestrutura robusta para lidar com alto volume de requests.
    - **Confiabilidade:** Provedores RPC garantem alta disponibilidade e performance.
    - **Segurança:** Provedores RPC implementam medidas de segurança para proteger seus dados.

- **Infura:**
    - Um dos provedores RPC mais populares.
    - Oferece acesso rápido e confiável à rede Ethereum.
    - Plano gratuito com limite de requests.
    - Planos pagos para maior volume e funcionalidades extras.
    - Fácil integração com bibliotecas como ethers.js e web3.js.

- **Alchemy:**
    - Provedor RPC com foco em desenvolvedores.
    - Oferece ferramentas e APIs avançadas para construir aplicações web3.
    - Monitoramento de transações, webhooks, NFTs APIs, etc.
    - Plano gratuito com limite de requests.
    - Planos pagos para maior volume e funcionalidades extras.

**Código (Exemplo com ethers.js e Infura):**

```javascript
const { ethers } = require("ethers");

const provider = new ethers.providers.JsonRpcProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID");

// ... usar o provider para interagir com a blockchain ...
```
