# Aula 5: **Anatomia de um Contrato Solidity**

## Abertura

Olá! Bem-vindo à quinta aula do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos os tipos de dados em Solidity e como utilizá-los em seus contratos inteligentes. Hoje, vamos entender a estrutura básica de um contrato Solidity, incluindo a definição de licenças, pragmas, imports, comentários, variáveis de estado e o construtor. Compreender a anatomia de um contrato é fundamental para escrever códigos claros, organizados e compatíveis com as melhores práticas da comunidade.

### Programação:

1. SPDX License Identifier
2. Pragmas
3. Imports
4. Comentários: Documentação no Código
5. Definição do Contrato e Variáveis de Estado
6. Construtor

---

## 1. SPDX License Identifier

O **SPDX License Identifier** é um identificador padrão que especifica a licença sob a qual o contrato é publicado. Adicionar o SPDX ajuda a esclarecer o tipo de licença, facilitando a revisão, a conformidade do código e a reutilização por outros desenvolvedores.

```solidity
// SPDX-License-Identifier: MIT
```

- **Por que usar?**: Especificar a licença promove a transparência e evita ambiguidades legais sobre o uso e modificação do código.
- **Identificadores de Licença Comuns**:
  - **MIT**: Permissiva, permite uso, cópia, modificação e distribuição.
  - **GPL-3.0**: Requer que as modificações também sejam distribuídas sob a mesma licença.
  - **Apache-2.0**: Permissiva, inclui cláusulas de patente.

**Exemplo:**

```solidity
// SPDX-License-Identifier: GPL-3.0
```

---

## 2. Pragmas

O **pragma** indica a versão do compilador Solidity necessária para compilar o contrato, ajudando a garantir que o código seja executado corretamente em versões suportadas. Isso previne incompatibilidades e comportamentos inesperados.

```solidity
pragma solidity ^0.8.0;
```

- **Especificando Versões**:
  - **Número de Versão Específico**:
    - `pragma solidity 0.8.17;`
    - Indica que o contrato deve ser compilado exatamente com a versão 0.8.17.
  - **Intervalo de Versões**:
    - `pragma solidity ^0.8.0;`
      - O operador `^` permite qualquer versão maior ou igual a 0.8.0 e menor que 0.9.0.
      - **Recomendado**, pois permite aproveitar melhorias e correções dentro da mesma série principal.
    - `pragma solidity >=0.7.0;`
      - Permite qualquer versão maior ou igual a 0.7.0.
      - **Menos restritivo**, mas pode levar a problemas de compatibilidade.

**Nota:** Sempre use o pragma adequado para garantir a segurança e funcionalidade do seu contrato.

---

## 3. Imports

O **import** permite a inclusão de outros contratos e bibliotecas em seu código Solidity, promovendo a modularidade e a reutilização. Isso facilita a organização do código e o uso de contratos padrão e seguros.

```solidity
import "@openzeppelin/contracts/access/Ownable.sol";
```

- **Por que usar?**: Reutilizar código bem testado e auditado reduz erros e vulnerabilidades.
- **Exemplo de Bibliotecas Comuns**:
  - **OpenZeppelin**: Conjunto de contratos padrão amplamente utilizado para implementação de padrões como ERC20, ERC721, controle de acesso, entre outros.

**Como usar:**

```solidity
// Importando o contrato Ownable para controle de propriedade
import "@openzeppelin/contracts/access/Ownable.sol";

contract MeuContrato is Ownable {
    // O código do contrato aqui
}
```

---

## 4. Comentários: Documentação no Código

Comentários são essenciais para tornar o código mais legível e compreensível, tanto para você quanto para outros desenvolvedores. Eles ajudam a explicar o que o código faz, por que certas decisões foram tomadas e como utilizar funções e variáveis.

### Tipos de Comentários

- **Comentários de Linha Única**:

  ```solidity
  // Este é um comentário de linha única
  ```

- **Comentários de Bloco**:

  ```solidity
  /*
     Este é um comentário de bloco.
     Pode abranger múltiplas linhas.
  */
  ```

- **Comentários do NatSpec (Ethereum Natural Language Specification Format)**:

  Usados para documentar contratos, funções e variáveis de acordo com um padrão que pode ser utilizado por ferramentas de documentação e interfaces gráficas.

  ```solidity
  /// @title Título do Contrato
  /// @author Autor
  /// @notice Explicação breve sobre o contrato ou função
  /// @dev Detalhes técnicos ou notas de desenvolvimento

  /// @param _usuario O endereço do usuário
  /// @return saldo O saldo atual do usuário
  ```

**Exemplo:**

```solidity
/// @title Contrato de Exemplo
/// @author Alice
/// @notice Este contrato demonstra o uso de comentários em Solidity
contract ExemploContrato {
    /// @notice Armazena o endereço do proprietário
    address public owner;

    /// @notice Construtor que define o proprietário inicial
    constructor() {
        owner = msg.sender; // Define o dono do contrato como quem o implantou
    }

    /// @notice Função que retorna o endereço do proprietário
    /// @return O endereço do proprietário atual
    function getOwner() public view returns (address) {
        return owner;
    }
}
```

---

## 5. Definição do Contrato e Variáveis de Estado

A **definição do contrato** é onde declaramos o nome do contrato e iniciamos sua implementação. As **variáveis de estado** são declaradas dentro do contrato e representam dados armazenados permanentemente na blockchain.

```solidity
contract ExemploContrato {
    
    // Variáveis de estado
    address public owner;    // Endereço do dono do contrato
    uint256 public balance;  // Saldo total do contrato

    // O restante do código do contrato
}
```

- **Variáveis de Estado**:
  - **Armazenamento Permanente**: Persistem entre transações e chamadas de funções.
  - **Visibilidade**: Podem ser públicas, privadas, internas ou externas.
  - **Tipos Comuns**: `uint`, `address`, `string`, `bool`, entre outros.

**Exemplo de Uso:**

```solidity
contract Banco {
    mapping(address => uint256) public saldos;

    // Funções para manipular os saldos
}
```

---

## 6. Construtor

O **construtor** é uma função especial que é executada uma única vez, no momento da implantação do contrato. Ele é usado para inicializar variáveis de estado e definir as condições iniciais do contrato.

```solidity
constructor() {
    owner = msg.sender; // Define o dono do contrato como quem o criou
    balance = 0;        // Inicializa o saldo com zero
}
```

- **Características do Construtor**:
  - **Executado uma única vez**: No momento da implantação.
  - **Inicialização**: Define valores iniciais para variáveis de estado.
  - **Parâmetros**: Pode aceitar argumentos para configurar o contrato no momento da implantação.

**Exemplo com Parâmetros:**

```solidity
contract Token {
    string public nome;
    string public simbolo;
    uint8 public decimais;
    uint256 public totalSupply;

    constructor(string memory _nome, string memory _simbolo, uint8 _decimais, uint256 _totalSupply) {
        nome = _nome;
        simbolo = _simbolo;
        decimais = _decimais;
        totalSupply = _totalSupply;
    }
}
```

---

## Conclusão

Nesta aula, exploramos a anatomia básica de um contrato Solidity. Compreendemos a importância de especificar a licença com o SPDX Identifier, definir a versão do compilador com o pragma, organizar o código usando imports e manter uma documentação clara através de comentários. Também vimos como declarar o contrato, definir variáveis de estado e inicializar o contrato usando o construtor. Esses componentes formam a base para escrever contratos inteligentes bem estruturados e aderentes às melhores práticas da comunidade.

---

## Recapitulação

1. **SPDX License Identifier**: Especifica a licença do contrato, promovendo conformidade legal e reutilização segura.
2. **Pragmas**: Indicam a versão do compilador Solidity necessária, garantindo compatibilidade e segurança.
3. **Imports**: Permitem incluir contratos e bibliotecas externas, facilitando a modularidade e reutilização de código.
4. **Comentários**: Melhoram a legibilidade e compreensão do código, sendo essenciais para documentação.
5. **Definição do Contrato e Variáveis de Estado**: Estrutura básica do contrato e armazenamento de dados persistentes na blockchain.
6. **Construtor**: Função especial para inicializar o contrato durante a implantação.

---

## Lição de casa

Crie um contrato simples chamado `MeuContrato` que inclui o SPDX Identifier, o pragma com a versão 0.8.0 e um comentário que descreve o contrato.

---

## Próxima aula

Na próxima aula, vamos explorar as variáveis globais do Solidity.