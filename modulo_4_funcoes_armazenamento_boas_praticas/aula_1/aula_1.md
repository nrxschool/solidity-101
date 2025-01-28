# Aula 1: **Funções em Solidity**

## Abertura

Olá! Bem-vindo à Aula 1 do nosso curso de Solidity para iniciantes. Até agora, exploramos os tipos de dados, a estrutura básica de um contrato e variáveis em Solidity. Hoje, vamos mergulhar em um dos conceitos mais fundamentais da programação de contratos inteligentes: as **funções**.

As funções são blocos de código reutilizáveis que executam tarefas específicas e são essenciais para interagir com seus contratos. Elas permitem modificar o estado do contrato, ler dados da blockchain, receber e enviar Ether, entre outras operações. Nesta aula, aprenderemos como declarar e usar funções em Solidity, incluindo o uso do construtor para inicializar o contrato.

### Programação:

1. O que são Funções em Solidity?
2. Sintaxe Básica de uma Função
3. Modificadores de Visibilidade
4. Funções `view`, `pure` e `payable`
5. O Construtor em Solidity
6. Exemplos Práticos

---

## 1. O que são Funções em Solidity?

As **funções** são blocos de código que executam tarefas específicas dentro de um contrato inteligente. Elas são fundamentais para estruturar o código de forma organizada e eficiente, permitindo:

- **Reutilização de Código**: Evita a repetição, tornando o contrato mais limpo e fácil de manter.
- **Modularidade**: Facilita a leitura e compreensão do código, separando funcionalidades em unidades lógicas.
- **Interação Externa**: Permite que usuários e outros contratos interajam com o contrato, chamando funções específicas.

### Funções Podem:

- **Modificar o Estado do Contrato**: Alterar valores de variáveis de estado, adicionar ou remover dados, entre outros.
- **Ler Dados da Blockchain**: Acessar informações armazenadas no contrato ou em variáveis globais.
- **Receber e Enviar Ether**: Gerenciar transações financeiras dentro da rede Ethereum.

---

## 2. Sintaxe Básica de uma Função

A declaração de uma função em Solidity segue uma sintaxe específica:

```solidity
function nomeDaFuncao(tipoParametro nomeParametro, ...) modificadores visibilidade returns (tipoRetorno) {
    // Corpo da função
}
```

### Componentes da Sintaxe:

- **`function`**: Palavra-chave que indica o início de uma função.
- **`nomeDaFuncao`**: Identificador único da função.
- **Parâmetros**: Lista de tipos e nomes de parâmetros de entrada.
- **Modificadores**: Palavras-chave que alteram o comportamento da função (e.g., `view`, `pure`, `payable`).
- **Visibilidade**: Define quem pode chamar a função (`public`, `private`, `internal`, `external`).
- **`returns`**: Especifica o tipo de dado que a função retorna.
- **Corpo da Função**: Bloco de código que define o comportamento da função.

### Exemplo Simples:

```solidity
function soma(uint a, uint b) public pure returns (uint) {
    return a + b;
}
```

- **Descrição**: Uma função pública que recebe dois números inteiros e retorna a soma deles. A função é `pure` porque não acessa nem modifica o estado do contrato.

---

## 3. Modificadores de Visibilidade

A visibilidade de uma função determina quem pode chamá-la. Existem quatro tipos de visibilidade em Solidity:

### 3.1 `public`

- **Acessível**: De dentro e de fora do contrato.
- **Uso**: Funções que devem ser chamadas por usuários externos ou outros contratos.
- **Comportamento**: Cria uma interface pública para a função.

**Exemplo:**

```solidity
function atualizarSaldo(uint novoSaldo) public {
    saldo = novoSaldo;
}
```

### 3.2 `private`

- **Acessível**: Apenas de dentro do contrato onde foi declarada.
- **Uso**: Funções auxiliares que não devem ser expostas externamente.
- **Comportamento**: Esconde a função de contratos externos e contratos derivados.

**Exemplo:**

```solidity
function _calcularTaxa(uint valor) private pure returns (uint) {
    return valor * 5 / 100;
}
```

### 3.3 `internal`

- **Acessível**: De dentro do contrato e de contratos que herdam dele.
- **Uso**: Funções que podem ser utilizadas por contratos filhos.
- **Comportamento**: Similar a `private`, mas permite acesso em contratos derivados.

**Exemplo:**

```solidity
function multiplicar(uint a, uint b) internal pure returns (uint) {
    return a * b;
}
```

### 3.4 `external`

- **Acessível**: Apenas de fora do contrato.
- **Uso**: Funções que são chamadas externamente, mas não internamente.
- **Comportamento**: Otimiza o uso de gás para chamadas externas.

**Exemplo:**

```solidity
function obterDados() external view returns (uint, address) {
    return (dados, msg.sender);
}
```

**Nota:** Embora `external` funcione similarmente a `public` para chamadas externas, ela não pode ser chamada internamente usando o nome da função diretamente. Em vez disso, é necessário usar `this.obterDados()`.

---

## 4. Funções `view`, `pure` e `payable`

### 4.1 Funções `view`

- **Definição**: Funções que **acessam** o estado do contrato, mas **não o modificam**.
- **Uso**: Ler valores de variáveis de estado sem alterar nada.
- **Comportamento**: Não consomem gás quando chamadas externamente sem transação (e.g., via `call`).

**Exemplo:**

```solidity
function consultarSaldo() public view returns (uint) {
    return saldo;
}
```

### 4.2 Funções `pure`

- **Definição**: Funções que **não acessam** nem **modificam** o estado do contrato.
- **Uso**: Executar cálculos que dependem apenas de parâmetros de entrada ou variáveis locais.
- **Comportamento**: Não consomem gás quando chamadas externamente sem transação.

**Exemplo:**

```solidity
function calcularQuadrado(uint x) public pure returns (uint) {
    return x * x;
}
```

### 4.3 Funções `payable`

- **Definição**: Funções que podem **receber Ether** durante sua execução.
- **Uso**: Necessárias para funções que aceitam pagamentos ou depósitos de Ether.
- **Comportamento**: Permitem que a função acesse `msg.value`, que contém o valor enviado na transação.

**Exemplo:**

```solidity
function receberPagamento() public payable {
    // O contrato pode acessar msg.value aqui
    emit PagamentoRecebido(msg.sender, msg.value);
}
```

---

## 5. O Construtor em Solidity

O **construtor** é uma função especial que é executada apenas uma vez, no momento em que o contrato é implantado. Ele é usado para inicializar variáveis de estado e definir configurações iniciais.

### Características do Construtor:

- **Nome**: `constructor` (a partir do Solidity 0.4.22).
- **Visibilidade**: Não possui visibilidade (não é necessário especificar `public` ou `private`).
- **Parâmetros**: Pode aceitar parâmetros para configurar o contrato durante a implantação.
- **Execução Única**: É executado apenas uma vez, não pode ser chamado novamente.

**Exemplo:**

```solidity
contract MeuContrato {
    address public owner;
    uint public taxa;

    constructor(uint _taxa) {
        owner = msg.sender; // Define o criador do contrato como o proprietário
        taxa = _taxa;       // Inicializa a taxa com o valor fornecido
    }
}
```

---

## Conclusão

Nesta aula, aprofundamos nosso conhecimento sobre funções em Solidity. Aprendemos como declarar e usar funções, entendendo a importância dos modificadores de visibilidade (`public`, `private`, `internal`, `external`) e das funções especiais (`view`, `pure`, `payable`). Também exploramos o uso do construtor para inicializar contratos e vimos exemplos práticos que ilustram como aplicar esses conceitos.

As funções são a espinha dorsal dos contratos inteligentes, permitindo criar lógica complexa e interativa. Compreender como elas funcionam e como utilizá-las efetivamente é crucial para desenvolver contratos seguros e eficientes.

---

## Recapitulação

1. **Funções em Solidity**: Blocos de código reutilizáveis que executam tarefas específicas dentro do contrato.
2. **Sintaxe de Funções**: Inclui nome, parâmetros, modificadores, visibilidade e tipo de retorno.
3. **Modificadores de Visibilidade**:
   - `public`: Acessível de dentro e fora do contrato.
   - `private`: Acessível apenas dentro do contrato.
   - `internal`: Acessível dentro do contrato e de contratos derivados.
   - `external`: Acessível apenas de fora do contrato.
4. **Funções `view`, `pure` e `payable`**:
   - `view`: Acessa o estado, mas não o modifica.
   - `pure`: Não acessa nem modifica o estado.
   - `payable`: Permite que a função receba Ether.
5. **O Construtor**: Função especial que inicializa o contrato no momento da implantação.
6. **Exemplos Práticos**: Aplicação dos conceitos em contratos reais.

---

## Lição de Casa

Crie um contrato chamado `Calculadora` com funções `soma`, `subtracao`, `multiplicacao` e `divisao`, todas como funções `pure`.

---

## Próxima Aula

Na próxima aula, exploraremos **eventos** em Solidity. Prepare-se para aprofundar ainda mais seus conhecimentos em Solidity! Até lá!

---