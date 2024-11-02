# Aula 5: **Criptografia: Chaves Públicas e Privadas, e Assinaturas Digitais**

## Abertura

Olá! Bem-vindo à quinta aula do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos os conceitos fundamentais de contas na Ethereum e como elas funcionam na blockchain. Hoje, vamos mergulhar em um tema essencial para a segurança e funcionamento da blockchain: a **criptografia**. Entenderemos como as chaves públicas e privadas funcionam e o papel das assinaturas digitais na autenticação e integridade das transações.

### Programação:

1. Introdução à Criptografia
2. Chaves Públicas e Privadas: A Base da Segurança
3. Assinaturas Digitais: Como Funcionam
4. Importância da Criptografia na Blockchain

---

## 1. Introdução à Criptografia

A **criptografia** é o estudo e prática de técnicas para comunicação segura na presença de terceiros mal-intencionados. Na blockchain, a criptografia garante que as transações sejam seguras, autênticas e íntegras.

### O que é Criptografia?

- **Criptografia Simétrica**:
  - Utiliza a **mesma chave** para criptografar e descriptografar informações.
  - Exemplo: Duas partes compartilham uma senha secreta para se comunicar.
- **Criptografia Assimétrica**:
  - Utiliza um **par de chaves**: uma chave pública e uma chave privada.
  - A chave pública criptografa os dados, e a chave privada descriptografa (ou vice-versa).
  - Base da segurança na blockchain e nas transações digitais.

### Funções Hash

- **Definição**: Algoritmos que transformam dados de qualquer tamanho em uma sequência fixa de caracteres, chamada de hash.
- **Características**:
  - **Determinísticas**: A mesma entrada sempre produz a mesma saída.
  - **Unidirecionais**: É impraticável obter a entrada original a partir do hash.
  - **Sensíveis a Alterações**: Pequenas mudanças na entrada resultam em hashes completamente diferentes.
- **Uso na Blockchain**:
  - Garante a integridade dos dados.
  - Utilizado na mineração e na criação de endereços.

### Por que a Criptografia é Importante na Blockchain?

- **Integridade**: Garante que as informações não foram alteradas durante a transmissão.
- **Autenticidade**: Verifica a identidade do remetente, assegurando que a mensagem ou transação veio de quem afirma ser.
- **Não-Repudiação**: Impede que alguém negue ter enviado uma mensagem ou transação.

## 2. Chaves Públicas e Privadas: A Base da Segurança

### O que são Chaves Públicas e Privadas?

- **Chave Pública**:
  - Pode ser compartilhada abertamente.
  - Utilizada para verificar assinaturas digitais feitas com a chave privada correspondente.
  - Serve como um identificador da conta na blockchain.
  - Endereços Ethereum são derivados da chave pública.
- **Chave Privada**:
  - Deve ser mantida em segredo absoluto.
  - Utilizada para assinar transações, provando que o remetente tem autoridade sobre a conta.
  - A perda ou exposição da chave privada compromete totalmente a segurança da conta.

### Como as Chaves são Geradas?

- **Algoritmos Criptográficos**:
  - **ECC (Elliptic Curve Cryptography)**: Utilizado na Ethereum para gerar pares de chaves.
  - Baseia-se em propriedades matemáticas de curvas elípticas para criar chaves seguras.
- **Processo de Geração**:
  - Uma **chave privada** é gerada aleatoriamente.
  - A **chave pública** é derivada matematicamente da chave privada.

### Endereços na Blockchain

- **Derivação do Endereço**:
  - O endereço Ethereum é derivado da chave pública, geralmente aplicando uma função hash.
  - Exemplo simplificado:
    - Chave Privada → Chave Pública → Hash da Chave Pública → Endereço.
- **Identificador Único**:
  - O endereço serve como identificador público da conta, permitindo que outros enviem transações para ela.

### Importância das Funções Hash

- **Segurança**:
  - As funções hash garantem que seja impraticável derivar a chave privada a partir do endereço ou da chave pública.
- **Integridade**:
  - Usadas para verificar a integridade dos dados e das transações.

## 3. Assinaturas Digitais: Como Funcionam

### O que é uma Assinatura Digital?

- Uma **assinatura digital** é um esquema matemático que demonstra a autenticidade de mensagens ou documentos digitais.
- Funciona como uma assinatura manuscrita, mas é muito mais segura.
- Garante que a mensagem veio do remetente pretendido e não foi alterada.

### Como as Assinaturas Digitais São Criadas?

1. **Preparação da Mensagem**:
   - A mensagem ou transação a ser enviada é definida.
2. **Criação do Hash da Mensagem**:
   - Aplica-se uma função hash à mensagem para obter uma representação fixa.
3. **Assinatura com a Chave Privada**:
   - O remetente usa sua chave privada para criptografar o hash da mensagem, criando a assinatura digital.
4. **Envio da Mensagem e Assinatura**:
   - A mensagem, junto com a assinatura digital, é enviada ao destinatário ou à rede.

### Como as Assinaturas Digitais São Verificadas?

1. **Recebimento da Mensagem e Assinatura**:
   - O destinatário recebe a mensagem e a assinatura digital.
2. **Hash da Mensagem Recebida**:
   - O destinatário aplica a mesma função hash à mensagem recebida.
3. **Verificação com a Chave Pública**:
   - Usa a chave pública do remetente para descriptografar a assinatura digital, recuperando o hash original.
4. **Comparação dos Hashes**:
   - Se o hash obtido da assinatura corresponder ao hash da mensagem recebida, a assinatura é válida.

### Benefícios das Assinaturas Digitais

- **Autenticidade**: Confirma que a mensagem veio do proprietário da chave privada.
- **Integridade**: Garante que a mensagem não foi alterada durante a transmissão.
- **Não-Repudiação**: O remetente não pode negar ter enviado a mensagem.

## 4. Importância da Criptografia na Blockchain

### Segurança das Transações

- A criptografia assegura que apenas o proprietário da chave privada possa movimentar os fundos de uma conta.
- Evita fraudes e roubos, desde que as chaves privadas sejam mantidas em segredo.

### Integridade da Rede

- As funções hash e assinaturas digitais garantem que os blocos e transações não sejam adulterados.
- Mantém a confiança na rede descentralizada, onde não há autoridade central.

### Autonomia dos Usuários

- Os usuários têm controle total sobre suas contas e transações.
- Não dependem de intermediários para validar ou autorizar operações.

### Desafios e Responsabilidades

- **Proteção das Chaves Privadas**:
  - A responsabilidade pela segurança das chaves privadas é inteiramente do usuário.
  - Perder a chave privada significa perder o acesso aos fundos permanentemente.
- **Ataques e Vulnerabilidades**:
  - Phishing, malware e outras técnicas podem ser usadas para roubar chaves privadas.
  - É crucial educar-se sobre práticas seguras.

## Conclusão

Nesta aula, exploramos os fundamentos da criptografia e seu papel vital na segurança da blockchain Ethereum. Compreendemos como as chaves públicas e privadas funcionam em conjunto para garantir a autenticidade e integridade das transações. Aprendemos sobre as assinaturas digitais e como elas asseguram que as transações são realizadas pelo verdadeiro proprietário da conta. A criptografia é o pilar que sustenta a confiança e a segurança em sistemas descentralizados como a Ethereum.

## Recapitulação

1. **Introdução à Criptografia**: Entendemos a diferença entre criptografia simétrica e assimétrica, e a importância das funções hash.
2. **Chaves Públicas e Privadas**: Exploramos como as chaves são geradas e seu papel na segurança das contas.
3. **Assinaturas Digitais**: Aprendemos como as assinaturas digitais garantem a autenticidade e integridade das transações.
4. **Importância da Criptografia na Blockchain**: Compreendemos como a criptografia protege a rede e os usuários, e a importância de proteger as chaves privadas.

## Lição de casa

Pesquise o que é uma função hash criptográfica e encontre exemplos de funções hash populares (como SHA-256 ou Keccak-256).

## Próxima aula

Na próxima aula, vamos explorar criar sua wallet e enviar uma transação para a blockchain.