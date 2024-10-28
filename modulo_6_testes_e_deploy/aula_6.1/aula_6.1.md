## Aula 6.1: Compilando e Implantando seu Contrato

**Objetivo:** Aprender a compilar seu contrato Solidity, entender o papel da ABI e realizar o deploy em uma rede blockchain.

**Conteúdo:**

- **Compilando seu Contrato:**
    - O compilador Solidity traduz o código Solidity para bytecode, que é o código que a EVM (Ethereum Virtual Machine) entende.
    - O compilador também gera a ABI (Application Binary Interface), que descreve como interagir com o contrato.
    - Ferramentas de compilação:
        - `solc` (compilador de linha de comando)
        - Remix IDE
        - Hardhat
        - Foundry

- **ABI: A Interface do seu Contrato:**
    - A ABI é um arquivo JSON que descreve as funções e eventos do contrato.
    - Ela define os tipos de dados dos parâmetros e retornos das funções.
    - A ABI é essencial para interagir com o contrato a partir de aplicações externas.

- **Implantando na Rede:**
    - **Ambiente:**
        - Escolher a rede para deploy:
            - Mainnet (rede principal)
            - Testnets (redes de teste)
            - Redes privadas
    - **Conta:**
        - Criar ou selecionar uma conta (wallet) com Ether suficiente para pagar o gás.
    - **Gás:**
        - Na Ethereum Virtual Machine (EVM), cada operação computacional possui um custo em uma unidade chamada "gás". Esse mecanismo garante que os contratos sejam executados de forma eficiente e segura, prevenindo ataques de negação de serviço.
        - O custo do gás depende da complexidade do contrato e da demanda da rede.
        - **Gas Limit e Gas Price:**
          > Gas Limit: É o limite máximo de gás que você está disposto a gastar em uma transação. Definir um limite protege você de custos inesperados caso ocorram loops infinitos ou erros no contrato. Se o contrato consumir mais gás do que o limite definido, a transação falhará, mas você ainda pagará pelo gás utilizado.
          >Gas Price: É o preço que você está disposto a pagar por unidade de gás. Um preço mais alto incentiva os mineradores a processarem sua transação mais rapidamente, mas também aumenta o custo total.
    - **Ferramentas de Deploy:**
        - Hardhat
        - Foundry

- **Etapas do Deploy:**
    - Compilar o contrato e obter o bytecode e a ABI.
    - Conectar à rede desejada.
    - Criar uma transação de deploy com o bytecode do contrato.
    - Assinar a transação com sua conta.
    - Enviar a transação para a rede.
    - Aguardar a confirmação da transação.