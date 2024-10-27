## Aula 1.3: Contas: Conceitos Fundamentais

**Objetivo:** Entender o conceito de "contas" no contexto da blockchain Ethereum e sua importância para o funcionamento dos contratos inteligentes.

**Conteúdo:**
  - **Introdução:**
      - Contas como "usuários" da blockchain.
      - Cada conta possui um endereço único.
      - Endereços: identificadores alfanuméricos que representam as contas na blockchain.
      - Tipos de contas: Contas Externas (EOA) e Contratos Inteligentes.
  - **Contas Externas (EOA):**
      - Controlada por um usuário (pessoa ou entidade).
      - Possui um par de chaves: pública e privada.
      - Chave pública: como um "número de conta" visível para todos, que permite receber transações.
      - Chave privada: como uma "senha" que permite controlar a conta e enviar transações.
      - Assinaturas digitais: autorizam transações a partir da chave privada, garantindo a autenticidade.
  - **Contratos Inteligentes:**
      - Código que reside na blockchain e possui um endereço.
      - Executado pela EVM quando acionado por uma transação.
      - Armazenamento próprio: variáveis de estado que persistem na blockchain.
      - Interação com outras contas: podem receber e enviar transações.
  - **Saldo:**
      - Quantidade de Ether (ETH) associada a uma conta.
      - Armazenado no estado da blockchain.
      - Transações: transferem ETH entre contas.
      - Gas: necessário para executar transações e contratos (abordado em detalhes na Aula 1.2).
  - **Nonce:**
      - Número que representa a ordem das transações enviadas por uma EOA.
      - Evita repetição e garante a ordem correta das operações.
