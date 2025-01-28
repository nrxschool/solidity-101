# Aula 2: **Tipos de Dados em Solidity (Parte 1)**

## Abertura

Olá! Bem-vindo à segunda aula do nosso curso de Solidity para iniciantes. Na aula anterior, exploramos como pensar diferente ao programar em Solidity e entendemos a filosofia da orientação a contratos. Hoje, vamos mergulhar nos **tipos de dados** em Solidity, que são fundamentais para escrever contratos inteligentes eficazes. Compreender os tipos de dados disponíveis nos permitirá manipular informações de forma correta e segura.

### Programação:

1. Tipos de Dados Básicos
2. Endereços (`address`)
3. Bytes e Strings
4. Variáveis em Solidity

---

## 1. Tipos de Dados Básicos

Em Solidity, os tipos de dados básicos são fundamentais para armazenar e manipular informações simples. Vamos explorar os principais tipos:

### Booleanos (`bool`)

- **Definição**: Representam valores lógicos, podendo ser `true` (verdadeiro) ou `false` (falso).
- **Uso**: Utilizados em condições, controle de fluxo e flags.
- **Exemplo**:

  ```solidity
  bool public ativo = true;
  ```

### Inteiros (`int` e `uint`)

#### Inteiros Sem Sinal (`uint`)

- **Definição**: Números inteiros não negativos (zero ou positivos).
- **Tamanhos Disponíveis**: De `uint8` a `uint256`, em incrementos de 8 bits.
  - Exemplo: `uint8`, `uint16`, `uint32`, ..., `uint256`.
- **Padrão**: Se não especificado, `uint` é equivalente a `uint256`.
- **Exemplo**:

  ```solidity
  uint public idade = 30;
  ```

#### Inteiros com Sinal (`int`)

- **Definição**: Números inteiros que podem ser negativos ou positivos.
- **Tamanhos Disponíveis**: De `int8` a `int256`, em incrementos de 8 bits.
  - Exemplo: `int8`, `int16`, `int32`, ..., `int256`.
- **Padrão**: Se não especificado, `int` é equivalente a `int256`.
- **Exemplo**:

  ```solidity
  int public temperatura = -10;
  ```

### Números de Ponto Flutuante (`fixed` e `ufixed`)

- **Observação**: Os tipos `fixed` e `ufixed` estão em fase experimental e não são amplamente suportados.
- **Definição**:
  - `fixed`: Números de ponto fixo com sinal.
  - `ufixed`: Números de ponto fixo sem sinal.
- **Uso**: Representam números com casas decimais.
- **Exemplo**:

  ```solidity
  // Ainda não suportado plenamente
  ```

**Importante**: Devido à falta de suporte completo, é comum utilizar inteiros para representar valores monetários, escalando por fatores (como wei para ether).

## 2. Endereços (`address`)

O tipo `address` é exclusivo do Solidity e é essencial para interagir com a blockchain Ethereum.

### Definição

- **`address`**: Representa um endereço Ethereum de 20 bytes.
- **`address payable`**: Subtipo de `address` que permite operações relacionadas ao envio de Ether.

### Uso

- **Armazenar Endereços**: Guardar o endereço de uma conta ou contrato.
- **Enviar Ether**: Usar `address payable` para transferir Ether para outro endereço.
- **Interagir com Contratos**: Chamar funções de outros contratos através de seus endereços.

### Exemplos

```solidity
address public dono;
address payable public carteira;

function definirDono(address _novoDono) public {
    dono = _novoDono;
}

function enviarPagamento() public payable {
    carteira.transfer(msg.value);
}
```

## 3. Bytes e Strings

### Bytes (`bytes`)

- **Definição**: Sequências de bytes que podem ser de tamanho fixo ou dinâmico.

#### Bytes de Tamanho Fixo

- **Tipos**: `bytes1`, `bytes2`, ..., `bytes32`.
- **Uso**: Armazenar dados binários de tamanho conhecido.
- **Exemplo**:

  ```solidity
  bytes32 public hash;
  ```

#### Bytes de Tamanho Dinâmico

- **Tipo**: `bytes`.
- **Uso**: Armazenar dados binários de tamanho variável.
- **Exemplo**:

  ```solidity
  bytes public dados;
  ```

### Strings (`string`)

- **Definição**: Sequências de caracteres em UTF-8 de tamanho dinâmico.
- **Uso**: Armazenar textos legíveis.
- **Limitações**: Operações avançadas com strings podem ser custosas em termos de gas.
- **Exemplo**:

  ```solidity
  string public nome = "Alice";
  ```

**Observação**: Strings e `bytes` de tamanho dinâmico são armazenados de forma similar, mas `string` é destinada a dados de texto, enquanto `bytes` é para dados binários.

## 4. Variáveis em Solidity

Entender como declarar e utilizar variáveis é fundamental para manipular dados em contratos inteligentes.

### Declaração de Variáveis

A sintaxe básica para declarar uma variável em Solidity é:

```solidity
tipoVisibilidade nomeDaVariavel;
```

- **tipo**: O tipo de dados da variável (por exemplo, `uint`, `bool`, `string`).
- **Visibilidade (opcional)**: `public`, `private`, `internal`, `external`.
- **nomeDaVariavel**: Identificador da variável.

### Atribuição de Valores

Podemos atribuir valores às variáveis no momento da declaração ou posteriormente.

#### Atribuição na Declaração

```solidity
uint public contador = 0;
```

#### Atribuição Posterior

```solidity
uint public contador;

function incrementar() public {
    contador = contador + 1;
}
```

### Visibilidade das Variáveis

- **public**: A variável pode ser acessada internamente e externamente. Um getter é criado automaticamente.
- **private**: Acessível apenas dentro do contrato onde foi declarada.
- **internal**: Acessível dentro do contrato e em contratos derivados (herança).
- **external**: Não aplicável para variáveis de estado, apenas para funções.

### Exemplos Completos

```solidity
pragma solidity ^0.8.0;

contract ExemploVariaveis {
    // Variável pública
    uint public numero;

    // Variável privada
    string private mensagem;

    // Variável internal
    address internal dono;

    // Função para definir o número
    function definirNumero(uint _novoNumero) public {
        numero = _novoNumero;
    }

    // Função para definir a mensagem
    function definirMensagem(string memory _novaMensagem) public {
        mensagem = _novaMensagem;
    }

    // Função para ler a mensagem (não disponível externamente)
    function lerMensagem() internal view returns (string memory) {
        return mensagem;
    }
}
```

## Conclusão

Nesta aula, exploramos os tipos de dados básicos em Solidity, incluindo booleanos, inteiros, endereços, bytes e strings. Também aprendemos como declarar e utilizar variáveis, compreendendo a importância dos modificadores de visibilidade. Esses fundamentos são essenciais para escrever contratos inteligentes que manipulam dados de forma eficaz e segura.

## Recapitulação

1. **Tipos de Dados Básicos**: `bool`, `int`, `uint`, `fixed`, `ufixed`.
2. **Endereços (`address`)**: Representam endereços Ethereum e são usados para interagir com a blockchain.
3. **Bytes e Strings**: Manipulação de dados binários e textos.
4. **Variáveis em Solidity**: Declaração, atribuição e visibilidade de variáveis.

## Lição de casa

- **Lição fácil**:
  - Declare uma variável `bool` chamada `ativo` e atribua a ela o valor `true`.
- **Lição média**:
  - Crie um contrato que armazena o nome e a idade de uma pessoa e fornece funções para atualizar e ler esses valores.
- **Lição difícil**:
  - Implemente um contrato que armazena um endereço `address payable` e inclui uma função para enviar Ether para esse endereço.

## Próxima aula

Na próxima aula, continuaremos explorando os tipos de dados em Solidity, focando em arrays, structs e mappings. Vamos aprender como esses tipos compostos nos permitem criar estruturas de dados mais complexas e poderosas. Até lá!