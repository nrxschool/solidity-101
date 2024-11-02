# Aula 4: **Tipos de Dados em Solidity (Parte 3)**

## Abertura

Olá! Bem-vindo à aula 3.2 do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos os tipos de dados básicos, operadores e estruturas condicionais em Solidity. Hoje, vamos aprofundar nosso conhecimento nos tipos de dados complexos, especificamente **arrays**, **mappings** e **enums**. Compreender esses tipos é essencial para criar contratos inteligentes mais sofisticados e eficientes. Vamos começar!

### Programação:

1. Arrays em Solidity
2. Mappings
3. Enums (Enumerações)

---

## 1. Arrays em Solidity

Os **arrays** são estruturas de dados que permitem armazenar coleções ordenadas de elementos do mesmo tipo. Eles são amplamente utilizados para gerenciar conjuntos de dados dentro dos contratos inteligentes.

### Tipos de Arrays

#### Arrays de Tamanho Fixo

- **Definição**: Arrays cujo tamanho é definido no momento da declaração e não pode ser alterado posteriormente.
- **Sintaxe**:

  ```solidity
  tipo[n] nomeDoArray;
  ```

  Onde `tipo` é o tipo dos elementos e `n` é o número de elementos.

- **Exemplo**:

  ```solidity
  uint[5] public numerosFixos = [1, 2, 3, 4, 5];
  ```

#### Arrays Dinâmicos

- **Definição**: Arrays que não têm um tamanho pré-definido e podem crescer ou diminuir durante a execução do contrato.
- **Sintaxe**:

  ```solidity
  tipo[] nomeDoArray;
  ```

- **Exemplo**:

  ```solidity
  string[] public listaDeNomes;
  ```

### Manipulação de Arrays

- **Adicionar Elementos**: Usando o método `push` em arrays dinâmicos.

  ```solidity
  function adicionarNome(string memory nome) public {
      listaDeNomes.push(nome);
  }
  ```

- **Acessar Elementos**: Usando o índice (começando em 0).

  ```solidity
  function obterNome(uint indice) public view returns (string memory) {
      return listaDeNomes[indice];
  }
  ```

- **Obter o Tamanho do Array**: Usando a propriedade `length`.

  ```solidity
  function tamanhoLista() public view returns (uint) {
      return listaDeNomes.length;
  }
  ```

- **Remover Elementos**: Em Solidity, não há um método direto para remover elementos de um array dinâmico. Uma abordagem comum é redefinir o valor ou manipular índices.

### Exemplo Completo

```solidity
pragma solidity ^0.8.0;

contract GerenciadorDeNomes {
    string[] public listaDeNomes;

    function adicionarNome(string memory nome) public {
        listaDeNomes.push(nome);
    }

    function obterNome(uint indice) public view returns (string memory) {
        require(indice < listaDeNomes.length, "Indice fora dos limites");
        return listaDeNomes[indice];
    }

    function tamanhoLista() public view returns (uint) {
        return listaDeNomes.length;
    }
}
```

---

## 2. Mappings

Os **mappings** são estruturas de dados chave-valor que funcionam como tabelas de hash ou dicionários. Eles são extremamente úteis para armazenar e recuperar dados associados a chaves específicas.

### Declaração de Mappings

- **Sintaxe**:

  ```solidity
  mapping(tipoDaChave => tipoDoValor) nomeDoMapping;
  ```

  - `tipoDaChave`: Pode ser qualquer tipo de dados por valor (como `uint`, `address`, `bytes32`), mas não tipos complexos como arrays, mappings ou structs.
  - `tipoDoValor`: Pode ser qualquer tipo, incluindo tipos complexos.

- **Exemplo**:

  ```solidity
  mapping(address => uint) public saldos;
  ```

### Uso de Mappings

- **Atribuir Valores**:

  ```solidity
  function depositar(uint valor) public {
      saldos[msg.sender] += valor;
  }
  ```

- **Recuperar Valores**:

  ```solidity
  function consultarSaldo(address conta) public view returns (uint) {
      return saldos[conta];
  }
  ```

### Características dos Mappings

- **Inicialização Padrão**: Todas as chaves possíveis existem e apontam para valores padrão (zero, endereço nulo, etc.).
- **Não Enumeráveis**: Não é possível iterar diretamente sobre um mapping para obter todas as chaves ou valores armazenados.
- **Combinação com Arrays**: Para rastrear todas as chaves utilizadas, é comum combinar mappings com arrays.

### Exemplo Completo

```solidity
pragma solidity ^0.8.0;

contract RegistroDeUsuarios {
    mapping(address => string) public nomes;
    address[] public enderecos;

    function registrarUsuario(string memory nome) public {
        nomes[msg.sender] = nome;
        enderecos.push(msg.sender);
    }

    function obterNome(address usuario) public view returns (string memory) {
        return nomes[usuario];
    }

    function totalUsuarios() public view returns (uint) {
        return enderecos.length;
    }
}
```

---

## 3. Enums (Enumerações)

As **enums** são tipos de dados personalizados que permitem definir conjuntos de constantes nomeadas. Elas são úteis para representar estados ou fases em um contrato, melhorando a legibilidade e a segurança do código.

### Declaração de Enums

- **Sintaxe**:

  ```solidity
  enum NomeDaEnum { Opção1, Opção2, Opção3 }
  ```

- **Exemplo**:

  ```solidity
  enum Estado { Inativo, Ativo, Suspenso }
  ```

### Uso de Enums

- **Definindo Variáveis de Enum**:

  ```solidity
  Estado public estadoAtual;
  ```

- **Atribuindo Valores**:

  ```solidity
  function ativar() public {
      estadoAtual = Estado.Ativo;
  }
  ```

- **Comparando Valores**:

  ```solidity
  function isAtivo() public view returns (bool) {
      return estadoAtual == Estado.Ativo;
  }
  ```

### Exemplo Completo

```solidity
pragma solidity ^0.8.0;

contract ProcessoDeVenda {
    enum Fase { Criacao, EmAndamento, Finalizado, Cancelado }
    Fase public faseAtual;

    constructor() {
        faseAtual = Fase.Criacao;
    }

    function iniciarVenda() public {
        require(faseAtual == Fase.Criacao, "A venda ja foi iniciada ou finalizada.");
        faseAtual = Fase.EmAndamento;
    }

    function finalizarVenda() public {
        require(faseAtual == Fase.EmAndamento, "A venda nao esta em andamento.");
        faseAtual = Fase.Finalizado;
    }

    function cancelarVenda() public {
        require(faseAtual != Fase.Finalizado, "A venda ja foi finalizada.");
        faseAtual = Fase.Cancelado;
    }

    function obterFaseAtual() public view returns (string memory) {
        if (faseAtual == Fase.Criacao) return "Criacao";
        if (faseAtual == Fase.EmAndamento) return "Em Andamento";
        if (faseAtual == Fase.Finalizado) return "Finalizado";
        if (faseAtual == Fase.Cancelado) return "Cancelado";
        return "Fase desconhecida";
    }
}
```

---

## Conclusão

Nesta aula, exploramos os tipos de dados complexos em Solidity: **arrays**, **mappings** e **enums**. Compreendemos como os arrays permitem armazenar coleções ordenadas de elementos, como os mappings nos ajudam a associar chaves a valores, e como as enums facilitam a representação de estados ou opções limitadas. Esses tipos de dados são fundamentais para construir contratos inteligentes robustos e eficientes, permitindo a manipulação avançada de dados.

---

## Recapitulação

1. **Arrays**: Estruturas que armazenam coleções ordenadas de elementos do mesmo tipo, podendo ser de tamanho fixo ou dinâmico.
2. **Mappings**: Estruturas chave-valor que permitem associar chaves a valores, muito úteis para armazenamento e recuperação eficiente de dados.
3. **Enums**: Tipos personalizados que definem conjuntos de constantes nomeadas, ideais para representar estados ou fases em um contrato.

---

## Próxima aula

Na próxima aula, vamos olhar a anatomia de um contrato em Solidity.