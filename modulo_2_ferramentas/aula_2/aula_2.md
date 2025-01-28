## Aula 2: Criando seu Primeiro Projeto com Hardhat

**Objetivo:** Aprender a criar um projeto com Hardhat, entender sua estrutura e os módulos principais que o compõem: Hardhat Network, Hardhat Ignition e Hardhat Runner.

**Conteúdo:**

### 1. Criando um Projeto com Hardhat:

- **Inicializar um novo projeto Node.js:** `npm init -y`
- **Instalar o Hardhat:** `npm install --save-dev hardhat`
- **Criar um projeto Hardhat:** `npx hardhat init`
- **Escolher a opção:** "Create an empty hardhat.config.js"

### 2. Entendendo a Estrutura do Projeto:

Após a criação do projeto, você terá a seguinte estrutura:

```
seu-projeto/
├── contracts/
│   └── ... seus contratos Solidity
├── ignition/
│   └── ... seus módulos
└── hardhat.config.js
```

- **`contracts/`**: pasta para armazenar seus contratos Solidity.
- **`ignition/`**: pasta abriga os arquivos de deploy, chamados de "módulos", que você configura para o Hardhat Ignition. Esses módulos definem como seus contratos inteligentes serão implantados em diferentes redes, especificando parâmetros, dependências e scripts personalizados para o processo de deploy.
- **`hardhat.config.js`**: arquivo de configuração do Hardhat.

**Módulos Principais do Hardhat:**

- **Hardhat Network:**
    - Uma rede Ethereum local para desenvolvimento e testes.
    - Permite executar seus contratos em um ambiente isolado e controlável.
    - Facilita a depuração e a execução de testes.
- **Hardhat Ignition:**
    - Ferramenta para implantar seus contratos em diferentes redes.
    - Simplifica o processo de deploy e oferece opções avançadas de configuração.
    - Suporta diversas redes, como mainnet, testnets e redes privadas.
- **Hardhat Runner:**
    - A interface de linha de comando do Hardhat.
    - Permite executar tarefas, como compilar contratos, executar testes e fazer deploy.
    - Oferece comandos para interagir com seus contratos e a blockchain.