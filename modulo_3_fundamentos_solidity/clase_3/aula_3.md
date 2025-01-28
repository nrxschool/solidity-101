# Aula 3: **Tipos de Dados em Solidity (Parte 2)**

## Abertura

Na aula anterior, exploramos os tipos de dados básicos em Solidity, como booleanos, inteiros, endereços, bytes e strings. Hoje, vamos continuar nossa jornada aprofundando nosso conhecimento sobre operadores e estruturas condicionais em Solidity. Compreender esses conceitos é essencial para manipular dados e controlar o fluxo de execução em seus contratos inteligentes. Vamos começar!

### Programação:

1. Operadores em Solidity
2. Estruturas Condicionais

---

## 1. Operadores em Solidity

Os **operadores** são símbolos que instruem o compilador a realizar operações matemáticas, lógicas ou relacionais específicas. Eles são fundamentais para manipular dados e tomar decisões dentro dos contratos inteligentes.

### Operadores Aritméticos

Utilizados para realizar operações matemáticas básicas.

- **Adição (`+`)**: Soma dois operandos.

  ```solidity
  uint a = 10 + 5; // Resultado: 15
  ```

- **Subtração (`-`)**: Subtrai o segundo operando do primeiro.

  ```solidity
  uint b = 10 - 5; // Resultado: 5
  ```

- **Multiplicação (`*`)**: Multiplica dois operandos.

  ```solidity
  uint c = 10 * 5; // Resultado: 50
  ```

- **Divisão (`/`)**: Divide o primeiro operando pelo segundo.

  ```solidity
  uint d = 10 / 5; // Resultado: 2
  ```

- **Módulo (`%`)**: Retorna o restante da divisão do primeiro operando pelo segundo.

  ```solidity
  uint e = 10 % 3; // Resultado: 1
  ```

- **Exponenciação (`**`)**: Eleva o primeiro operando à potência do segundo.

  ```solidity
  uint f = 2 ** 3; // Resultado: 8
  ```

### Operadores de Comparação

Utilizados para comparar valores e retornar um valor booleano (`true` ou `false`).

- **Igual a (`==`)**: Verifica se dois operandos são iguais.

  ```solidity
  bool resultado = (5 == 5); // true
  ```

- **Diferente de (`!=`)**: Verifica se dois operandos são diferentes.

  ```solidity
  bool resultado = (5 != 3); // true
  ```

- **Maior que (`>`)**: Verifica se o primeiro operando é maior que o segundo.

  ```solidity
  bool resultado = (5 > 3); // true
  ```

- **Menor que (`<`)**: Verifica se o primeiro operando é menor que o segundo.

  ```solidity
  bool resultado = (5 < 3); // false
  ```

- **Maior ou igual a (`>=`)**: Verifica se o primeiro operando é maior ou igual ao segundo.

  ```solidity
  bool resultado = (5 >= 5); // true
  ```

- **Menor ou igual a (`<=`)**: Verifica se o primeiro operando é menor ou igual ao segundo.

  ```solidity
  bool resultado = (5 <= 3); // false
  ```

### Operadores Lógicos

Utilizados para combinar condições lógicas.

- **E Lógico (`&&`)**: Retorna `true` se ambos os operandos forem verdadeiros.

  ```solidity
  bool resultado = (true && false); // false
  ```

- **Ou Lógico (`||`)**: Retorna `true` se pelo menos um dos operandos for verdadeiro.

  ```solidity
  bool resultado = (true || false); // true
  ```

- **Negação Lógica (`!`)**: Inverte o valor lógico do operando.

  ```solidity
  bool resultado = !true; // false
  ```

**Exemplo Prático:**

```solidity
pragma solidity ^0.8.0;

contract OperadoresExemplo {
    function operacoesAritmeticas(uint a, uint b) public pure returns (uint soma, uint subtracao, uint multiplicacao, uint divisao, uint modulo, uint exponenciacao) {
        soma = a + b;
        subtracao = a - b;
        multiplicacao = a * b;
        divisao = a / b;
        modulo = a % b;
        exponenciacao = a ** b;
    }

    function comparacoes(uint a, uint b) public pure returns (bool igual, bool diferente, bool maior, bool menor, bool maiorOuIgual, bool menorOuIgual) {
        igual = a == b;
        diferente = a != b;
        maior = a > b;
        menor = a < b;
        maiorOuIgual = a >= b;
        menorOuIgual = a <= b;
    }

    function logicos(bool x, bool y) public pure returns (bool eLogico, bool ouLogico, bool negacaoX) {
        eLogico = x && y;
        ouLogico = x || y;
        negacaoX = !x;
    }
}
```

---

## 2. Estruturas Condicionais

As estruturas condicionais permitem que o contrato tome decisões com base em determinadas condições, controlando o fluxo de execução do código.

### `if`, `else if`, `else`

- **`if`**: Executa um bloco de código se a condição for verdadeira.

  ```solidity
  if (condicao) {
      // Código a ser executado se a condição for verdadeira
  }
  ```

- **`else if`**: Opcional, verifica outra condição se a anterior for falsa.

  ```solidity
  if (condicao1) {
      // Código se condicao1 for verdadeira
  } else if (condicao2) {
      // Código se condicao1 for falsa e condicao2 for verdadeira
  }
  ```

- **`else`**: Opcional, executa um bloco de código se todas as condições anteriores forem falsas.

  ```solidity
  if (condicao1) {
      // Código se condicao1 for verdadeira
  } else if (condicao2) {
      // Código se condicao1 for falsa e condicao2 for verdadeira
  } else {
      // Código se todas as condições forem falsas
  }
  ```

## Conclusão

Nesta aula, aprofundamos nosso conhecimento sobre operadores e estruturas condicionais em Solidity. Entendemos como utilizar operadores aritméticos, de comparação e lógicos para manipular dados e controlar o fluxo de execução de nossos contratos inteligentes. As estruturas condicionais, como `if`, `else if` e `else`, são fundamentais para tomar decisões dentro do código, permitindo que os contratos reajam a diferentes situações.

Compreender esses conceitos é essencial para escrever contratos inteligentes eficazes e funcionais, pois a lógica condicional e as operações sobre os dados são a base de qualquer aplicação programável.

---

## Recapitulação

1. **Operadores em Solidity**: Aprendemos sobre operadores aritméticos (`+`, `-`, `*`, `/`, `%`, `**`), de comparação (`==`, `!=`, `>`, `<`, `>=`, `<=`) e lógicos (`&&`, `||`, `!`), e como utilizá-los em nossos contratos.
2. **Estruturas Condicionais**: Vimos como controlar o fluxo de execução do contrato usando `if`, `else if` e `else`, permitindo que o contrato tome decisões baseadas em condições específicas.

---

## Lição de casa

Desenvolva um contrato chamado `Comparador` que tenha uma função que receba dois números inteiros e retorne uma string indicando qual número é maior, ou se eles são iguais.

## Próxima aula

Na próxima aula, continuaremos explorando os tipos de dados em Solidity, focando em arrays, mappings e estruturas mais complexas. Aprenderemos como essas estruturas nos permitem criar contratos inteligentes mais poderosos e flexíveis. Prepare-se para aprofundar ainda mais seus conhecimentos em Solidity! Até lá!