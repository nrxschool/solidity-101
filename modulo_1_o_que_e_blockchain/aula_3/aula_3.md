# Aula 3: **Consenso, Estado e a Máquina Virtual Ethereum (EVM)**

## Abertura

Olá! Bem-vindo à terceira aula do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos o block explorer e entendemos os fundamentos do Ethereum e dos contratos inteligentes. Hoje, vamos aprofundar nosso conhecimento nos pilares fundamentais que sustentam a rede Ethereum: o consenso, o estado e a Máquina Virtual Ethereum (EVM). Esses conceitos são essenciais para entender como a blockchain funciona e como os contratos inteligentes são executados.

### Programação:

1. Mecanismos de Consenso na Blockchain
2. O Conceito de Estado na Ethereum
3. A Máquina Virtual Ethereum (EVM)
4. Componentes e Funcionamento da EVM

---

## 1. Mecanismos de Consenso na Blockchain

### O que é Consenso?

O **consenso** na blockchain é o acordo geral entre os nós da rede sobre o estado atual e a validade das transações. É o processo que garante que todas as partes da rede estejam sincronizadas e concordem com a sequência de blocos adicionados à blockchain.

> **Definição:** Mecanismo pelo qual os participantes da rede concordam sobre uma única versão da verdade, assegurando a integridade e a segurança da blockchain.

### Importância do Consenso

- **Integridade da Rede**: Garante que todos os nós tenham a mesma informação, evitando divergências.
- **Segurança**: Protege a rede contra ataques e tentativas de fraude.
- **Imutabilidade**: Uma vez que um bloco é adicionado, não pode ser alterado sem o consenso da maioria.

### Como Funciona o Consenso?

Existem dois principais passos no processo de consenso:

1. **Decidir Quem Vai Produzir e Propor o Bloco**:
   - Utiliza mecanismos como Proof-of-Work (PoW) ou Proof-of-Stake (PoS) para selecionar o produtor do próximo bloco.
   - **Objetivo**: Garantir que a escolha seja justa e impedir que um único participante controle a rede.

2. **Aceitação do Bloco pelos Demais Nós**:
   - Após a criação, o bloco é propagado para os outros nós para validação.
   - Se a maioria aceitar o bloco, ele é adicionado à blockchain.

> **Nota:** O consenso impede ataques Sybil, nos quais um único agente tenta assumir múltiplas identidades para controlar a rede.

### Mecanismos de Consenso no Ethereum

#### Proof-of-Work (PoW): O Antigo Mecanismo

- **Criação de Blocos**: Mineradores competiam para resolver problemas matemáticos complexos (hashing) para criar novos blocos.
- **Recompensa**: O primeiro a resolver o problema adicionava o bloco e recebia uma recompensa em ETH.
- **Segurança**: A segurança era garantida pela necessidade de controlar 51% do poder computacional da rede, o que é extremamente custoso.

#### Proof-of-Stake (PoS): O Atual Mecanismo

- **Criação de Blocos**: Validadores são selecionados aleatoriamente para propor novos blocos, baseados na quantidade de ETH em stake (garantia).
- **Recompensa**: Validadores honestos recebem recompensas por validar e propor blocos corretamente.
- **Segurança**: Ataques são desencorajados, pois os validadores podem perder seu stake em caso de comportamento malicioso.

> **Benefícios do PoS**:
>
> - **Eficiência Energética**: Consome menos energia que o PoW.
> - **Descentralização**: Facilita a participação de mais validadores.
> - **Segurança Econômica**: Ataques se tornam financeiramente inviáveis.

## 2. O Conceito de Estado na Ethereum

### O que é Estado?

O **estado** na Ethereum representa a condição atual da rede em um determinado momento, incluindo saldos de contas, armazenamento de contratos inteligentes e outros dados persistentes.

> **Definição:** Fotografia do sistema que reflete todas as informações e dados armazenados na blockchain naquele instante.

### Armazenamento do Estado

- **Saldos de Contas**: Quantidade de ETH que cada endereço possui.
- **Contratos Inteligentes**: Código e armazenamento interno dos contratos.
- **Dados Persistentes**: Informações que precisam ser mantidas entre transações.

### Mudanças de Estado

- O estado é alterado através de **transações** que executam operações, como transferências de ETH ou chamadas a contratos inteligentes.
- Cada transação válida resulta em uma atualização do estado global da rede.

### Papel da EVM no Estado

A **Máquina Virtual Ethereum (EVM)** processa as transações e aplica as mudanças necessárias ao estado, garantindo que cada nó na rede tenha uma cópia atualizada e consistente.

## 3. A Máquina Virtual Ethereum (EVM)

### O que é a EVM?

A **Máquina Virtual Ethereum (EVM)** é o ambiente de execução dos contratos inteligentes na Ethereum. Ela é responsável por interpretar e executar o bytecode dos contratos inteligentes.

> **Definição:** Uma máquina virtual Turing Completa que permite a execução de código arbitrário, desde que haja gas suficiente para pagar pela computação.

### Características da EVM

- **Turing Completa**: Capaz de executar qualquer cálculo computacional, dado recursos suficientes.
- **Isolamento**: Executa contratos em um ambiente isolado, garantindo a segurança da rede.
- **Determinística**: Garante que, dada uma entrada específica, o resultado será sempre o mesmo em todos os nós.

### Gas na EVM

- O **gas** é a unidade de medida do esforço computacional na EVM.
- Cada operação tem um custo em gas, que deve ser pago pelo remetente da transação.
- O gas impede loops infinitos e uso excessivo de recursos, garantindo que os contratos sejam executados de forma eficiente.

## 4. Componentes e Funcionamento da EVM

### Funcionamento da EVM

1. **Leitura e Verificação da Transação**: A EVM recebe a transação e verifica sua validade e assinatura.
2. **Inicialização com o Código do Contrato**: Carrega o bytecode do contrato inteligente a ser executado.
3. **Execução Passo a Passo do Código**: Interpreta cada instrução (opcode) e executa as operações correspondentes.
4. **Cálculo e Dedução do Gas**: Calcula o gas consumido por cada operação e deduz do total fornecido.
5. **Atualização do Estado**: Aplica as mudanças resultantes da execução ao estado global.
6. **Retorno de Resultados**: Fornece a saída ou resultado da execução, se aplicável.

### Componentes Principais da EVM

- **Storage**: Armazenamento permanente utilizado pelos contratos para guardar dados entre transações. É específico por contrato e persiste na blockchain.
- **Memory**: Memória temporária utilizada durante a execução de uma transação. É limpa após a conclusão da execução.
- **Stack**: Pilha de dados usada para operações temporárias e passagem de argumentos entre instruções.
- **Code**: O bytecode do contrato inteligente que está sendo executado.
- **Args (Argumentos)**: Dados de entrada fornecidos à função ou contrato que está sendo chamado.

### Opcodes

- **Definição**: Instruções básicas que a EVM pode executar, como operações aritméticas, lógicas, acesso a armazenamento, etc.
- **Exemplos**:
  - `ADD`: Soma dois valores.
  - `SSTORE`: Armazena um valor no storage.
  - `CALL`: Chama outra função ou contrato.

> **Nota:** O conhecimento dos opcodes é avançado, mas entender que cada linha de código Solidity é compilada em uma sequência de opcodes ajuda a otimizar e escrever contratos mais eficientes.

## Conclusão

Nesta aula, exploramos os conceitos fundamentais que permitem o funcionamento da Ethereum:

- Compreendemos como o **consenso** mantém a rede segura e confiável.
- Aprendemos sobre o **estado**, que representa as informações atuais da blockchain.
- Conhecemos a **EVM**, o ambiente onde os contratos inteligentes são executados.
- Detalhamos os **componentes e o funcionamento da EVM**, essenciais para a execução correta e eficiente dos contratos.

Esses conceitos são cruciais para qualquer desenvolvedor que deseja criar contratos inteligentes seguros e eficientes na rede Ethereum.

## Recapitulação

1. **Mecanismos de Consenso na Blockchain**: O acordo entre os nós sobre o estado da rede, garantindo integridade e segurança.
2. **O Conceito de Estado na Ethereum**: Representa a condição atual da blockchain, incluindo saldos e dados de contratos.
3. **A Máquina Virtual Ethereum (EVM)**: Ambiente de execução dos contratos inteligentes, capaz de executar código arbitrário.
4. **Componentes e Funcionamento da EVM**: Como a EVM processa transações, gerencia memória e atualiza o estado.

## Lição de casa

Investigue como os opcodes afetam o consumo de gas e escreva um breve resumo sobre como otimizar um contrato inteligente considerando os opcodes utilizados.

## Próxima aula

Na próxima aula, vamos falar sobre as wallets!