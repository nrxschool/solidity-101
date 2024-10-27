## Aula 1.2: Consenso, Estado e a Máquina Virtual Ethereum (EVM)

**Objetivo:**  Compreender os conceitos de consenso, estado e a Máquina Virtual Ethereum (EVM), pilares fundamentais do funcionamento da blockchain Ethereum.

**Conteúdo:**

- **Introdução:**
    - Recapitular a natureza descentralizada da blockchain.
    - Problema: Como garantir que todos os nós concordem com o estado da rede?
    - Solução: Mecanismos de Consenso.

- **Consenso:**
    - Definição: Acordo geral entre os nós sobre o estado da blockchain.
        > O termo "mecanismo de consenso" refere-se a todo o conjunto de protocolos, incentivos e ideias que permitem que uma rede de nós concorde sobre o estado de uma blockchain. Em outras palavras, é a forma como a rede garante que todos os participantes estejam em sincronia e concordem com a validade das transações e a ordem dos blocos.

    - Importância: Integridade, segurança e imutabilidade da rede.
    - Como Funciona:
    - 1. Decidir quem vai produzir e propor o bloco:
        > Protocolos como Proof-of-Stake (PoS) ou Proof-of-Work (PoW) são mecanismos para resolver este problema.
    - 2. Aceitação do bloco pelos demais pares na rede:
        > Uma vez decidido quem produz o bloco, ele precisa ser aceito pela maioria da rede para ser adicionado à blockchain.
    > O objetivo principal desses mecanismos é impedir o ataque Sybil, garantindo que uma única pessoa não domine a produção de blocos e manipule a rede.

    - Proof-of-Work (PoW): O antigo mecanismo do Ethereum.
        > Criação de Blocos: Mineradores competiam para criar novos blocos resolvendo problemas matemáticos complexos. O primeiro a encontrar a solução adicionava o bloco à blockchain e recebia uma recompensa em ETH.
        > Segurança: A segurança da rede era garantida pela necessidade de controlar 51% do poder computacional da rede para realizar um ataque, o que é extremamente custoso.

    - Proof-of-Stake (PoS): O atual mecanismo do Ethereum.
        > Criação de Blocos: Validadores são responsáveis por criar blocos. Um validador é selecionado aleatoriamente para propor um novo bloco.
        > Segurança: A segurança é garantida por incentivos econômicos. Validadores precisam depositar ETH como garantia ("stake") e são recompensados por bom comportamento. Ataques à rede se tornam inviáveis, pois exigiriam a perda de grandes quantias de ETH.

- **Estado:**
    - Definição: Fotografia do sistema em um determinado momento.
    - Armazenamento: Dados persistentes na blockchain (saldos, contratos, etc.).
    - Mudanças de estado: Ocorrem através de transações.
    - EVM: Responsável por processar as transações e atualizar o estado.

- **Máquina Virtual Ethereum (EVM):**
    - Definição: Ambiente de execução para contratos inteligentes.
    - Turing Completa: Capaz de executar qualquer programa (com limite de Gas).
    - Gas: Unidade de medida para o custo computacional.
    - Funcionamento da EVM:
        - Leitura e verificação da transação.
        - Inicialização da EVM com o código do contrato.
        - Execução passo-a-passo do código.
        - Cálculo e dedução do Gas.
        - Atualização do estado.
        - Retorno de resultados.
    - Componentes da EVM:
        - Storage: Armazenamento permanente na blockchain.
        - Memory: Memória temporária durante a execução.
        - Stack: Pilha para guardar valores temporários.
        - Code: Bytecode do contrato inteligente.
        - Args: Argumentos de entrada da função.
    - Opcodes: Instruções que a EVM pode executar.

**Materiais Complementares:**

- [O que é a Máquina Virtual Ethereum (EVM)? - Coinbase](https://www.coinbase.com/pt-br/learn/crypto-glossary/what-is-the-ethereum-virtual-machine)
- [Ethereum Virtual Machine (EVM): O Que é E Como Funciona? - Bitso Blog](https://blog.bitso.com/pt-br/tecnologia/ethereum-virtual-machine)
- [Understanding Blockchain Consensus Mechanisms](https://youtu.be/ojxfbN78WFQ)
