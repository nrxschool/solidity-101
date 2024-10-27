## Aula 3.2: Tipos de Dados em Solidity (Parte 1)

**Objetivo:** Conhecer os tipos de dados básicos e complexos disponíveis em Solidity, incluindo booleanos, inteiros, números de ponto flutuante, endereços, bytes, strings, arrays e mappings.

**Conteúdo:**

- **Tipos de Dados Básicos:**
    - **Booleanos (`bool`):** Representam valores verdadeiro (`true`) ou falso (`false`).
    - **Inteiros (`int` e `uint`):**
        - `int`: números inteiros com sinal (positivos e negativos).
        - `uint`: números inteiros sem sinal (apenas positivos).
        - Tamanhos: `int8`, `int16`, `int32`, ..., `int256`, `uint8`, `uint16`, ..., `uint256`.
    - **Números de Ponto Flutuante (`fixed` e `ufixed`):**
        - `fixed`: números com ponto flutuante com sinal.
        - `ufixed`: números com ponto flutuante sem sinal.
- **Endereços (`address`):**
    - Representam endereços na blockchain Ethereum.
    - Podem ser usados para enviar e receber Ether.
    - Tipos: `address` e `address payable` (para endereços que podem receber Ether).
- **Bytes (`bytes`):**
    - Sequências de bytes de tamanho fixo (`bytes1`, `bytes2`, ..., `bytes32`).
- **Strings (`string`):**
    - Sequências de caracteres UTF-8 de tamanho dinâmico.
- **Variáveis:**
    - Declaração de variáveis: `tipo nomeDaVariavel;`
    - Atribuição de valores: `nomeDaVariavel = valor;`