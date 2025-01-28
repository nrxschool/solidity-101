# Aula 1: **Tipos de Dados Complexos: Structs**

## Abertura

Olá! Bem-vindo à quinta aula do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos variáveis, funções, eventos e técnicas para escrever código seguro. Hoje, vamos nos aprofundar nos **tipos de dados complexos** em Solidity, com foco especial nas **structs**. As structs são ferramentas poderosas que permitem organizar e representar dados de forma estruturada dentro dos seus contratos inteligentes. Com elas, você pode criar modelos de dados mais ricos e expressivos, facilitando o gerenciamento de informações complexas.

### Programação:

1. Tipos de Dados Complexos em Solidity
2. Structs
3. Structs em Arrays e Mappings
4. Utilizando Structs em Funções

---

## 1. Tipos de Dados Complexos em Solidity

### Visão Geral

Solidity oferece tipos de dados complexos que permitem representar estruturas de dados mais elaboradas. Além dos tipos básicos (como `uint`, `bool`, `address`, etc.), temos:

- **Structs**: Conjuntos personalizados de variáveis agrupadas sob um único nome.

---

## 2. Introdução às Structs

### O que são Structs?

- **Definição**: Uma `struct` é uma estrutura que permite agrupar variáveis de diferentes tipos sob um único nome.
- **Uso**: Ideal para representar objetos ou entidades com múltiplos atributos, como usuários, produtos, transações, etc.

### Características das Structs

- Podem conter variáveis de qualquer tipo, incluindo tipos básicos, arrays e até outras structs.
- São definidas dentro do contrato e podem ser utilizadas como tipos personalizados.
- Facilitam a organização de dados complexos.

---

## 3. Declarando Structs

### Sintaxe Básica

```solidity
struct NomeDaStruct {
    tipo variavel1;
    tipo variavel2;
    // ... mais variáveis
}
```

- **`struct`**: Palavra-chave para declarar uma nova struct.
- **`NomeDaStruct`**: O nome que você escolhe para a sua struct.
- **Variáveis**: Lista de variáveis com seus tipos e nomes.

### Exemplo de Declaração

```solidity
struct Produto {
    string nome;
    uint256 preco;
    bool disponivel;
}
```

- **Descrição**: Criamos uma struct `Produto` que possui três atributos:
  - `nome`: O nome do produto (`string`).
  - `preco`: O preço do produto em wei (`uint256`).
  - `disponivel`: Indica se o produto está disponível para venda (`bool`).

---

## 4. Utilizando Structs em Variáveis

### Declarando Variáveis do Tipo Struct

Após declarar uma struct, podemos criar variáveis desse tipo.

#### Variável de Estado

```solidity
Produto public meuProduto;
```

- **Descrição**: Declara uma variável pública de estado chamada `meuProduto` do tipo `Produto`.

#### Variável Local

Dentro de funções, podemos declarar variáveis locais do tipo struct.

```solidity
function criarProduto() public {
    Produto memory novoProduto;
    // ...
}
```

- **Nota**: Usamos `memory` para indicar que a variável é armazenada em memória temporária durante a execução da função.

### Inicializando Structs

#### Método 1: Usando Parâmetros

```solidity
produto = Produto("Camiseta", 1000, true);
```

- **Descrição**: Inicializa a variável `produto` com valores específicos.

#### Método 2: Atribuindo Valores Diretamente

```solidity
Produto memory produtoTemp;
produtoTemp.nome = "Camiseta";
produtoTemp.preco = 1000;
produtoTemp.disponivel = true;
```

- **Descrição**: Atribui valores aos membros individualmente.

---

## 5. Acessando e Modificando Membros da Struct

### Operador Ponto (`.`)

Usamos o operador ponto para acessar e modificar os membros da struct.

#### Exemplo de Acesso

```solidity
string memory nomeProduto = meuProduto.nome;
uint precoProduto = meuProduto.preco;
bool estaDisponivel = meuProduto.disponivel;
```

#### Exemplo de Modificação

```solidity
meuProduto.preco = 1200;
meuProduto.disponivel = false;
```

---

## 6. Structs em Arrays e Mappings

### Array de Structs

Podemos criar arrays que armazenam múltiplas structs.

#### Declaração

```solidity
Produto[] public produtos;
```

- **Descrição**: Declara um array dinâmico público de `Produto`.

#### Adicionando Structs ao Array

```solidity
function adicionarProduto(string memory _nome, uint256 _preco) public {
    produtos.push(Produto(_nome, _preco, true));
}
```

### Mapping de Structs

Podemos mapear chaves para structs.

#### Declaração

```solidity
mapping(uint256 => Produto) public produtos;
```

- **Descrição**: Mapeia um `uint256` (por exemplo, um ID) para um `Produto`.

#### Atribuição

```solidity
function adicionarProduto(uint256 _id, string memory _nome, uint256 _preco) public {
    produtos[_id] = Produto(_nome, _preco, true);
}
```

---

## 7. Utilizando Structs em Funções

### Passando Structs como Parâmetros

Podemos passar structs como parâmetros para funções.

#### Exemplo

```solidity
function atualizarProduto(uint256 _id, Produto memory _produtoAtualizado) public {
    produtos[_id] = _produtoAtualizado;
}
```

- **Nota**: Ao passar structs, é importante especificar `memory` ou `storage` conforme necessário.

### Retornando Structs de Funções

Podemos retornar structs de funções.

#### Exemplo

```solidity
function obterProduto(uint256 _id) public view returns (Produto memory) {
    return produtos[_id];
}
```

---

## Conclusão

Nesta aula, exploramos os **tipos de dados complexos** em Solidity, com foco nas **structs**. Vimos como as structs permitem agrupar variáveis de diferentes tipos em uma única unidade, facilitando a organização e manipulação de dados complexos. Aprendemos a declarar structs, criar variáveis do tipo struct, acessar e modificar seus membros, e utilizar structs em arrays e mappings. Também desenvolvemos um exemplo prático de um sistema de cadastro de produtos, demonstrando como aplicar esses conceitos em um contrato real.

As structs são ferramentas essenciais para representar entidades do mundo real em seus contratos inteligentes, tornando o código mais intuitivo e fácil de manter. Compreender e utilizar structs efetivamente é um passo importante na jornada para se tornar um desenvolvedor Solidity proficiente.

---

## Recapitulação

1. **Tipos de Dados Complexos**:
   - Arrays, mappings e structs permitem representar dados mais elaborados.
2. **Structs**:
   - Permitem agrupar variáveis de diferentes tipos em uma única unidade.
3. **Declarando Structs**:
   - Utilizamos a sintaxe `struct NomeDaStruct { ... }`.
4. **Variáveis do Tipo Struct**:
   - Podem ser declaradas como variáveis de estado ou locais.
5. **Acesso e Modificação**:
   - Usamos o operador ponto (`.`) para acessar e modificar os membros.
6. **Structs em Arrays e Mappings**:
   - Podemos armazenar structs em arrays e mappings para gerenciar múltiplos itens.
7. **Structs em Funções**:
   - Podemos passar structs como parâmetros e retorná-las de funções.
8. **Exemplo Prático**:
   - Desenvolvemos um sistema de cadastro de produtos utilizando structs.

---

## Lição de Casa

Crie um contrato chamado `RegistroDePessoas` que utilize uma struct `Pessoa` com os atributos `nome`, `idade` e `endereco`. Inclua funções para adicionar uma nova pessoa e obter os dados de uma pessoa pelo nome.

---

## Próxima Aula

Na próxima aula, exploraremos o conceito de **Contratos Abstratos e Interfaces**. Nos vemos lá!