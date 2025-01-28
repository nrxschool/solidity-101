# Aula 3: **`virtual` e `override`: Herança e Polimorfismo**

## Abertura

Olá! Bem-vindo à Aula 3 do curso de Solidity. Na aula de hoje, vamos explorar dois conceitos fundamentais na programação orientada a objetos: **Herança** e **Polimorfismo**. Em Solidity, esses conceitos são implementados através das funções `virtual` e `override`, que permitem criar contratos extensíveis e reutilizáveis. Entender como esses mecanismos funcionam é essencial para desenvolver contratos inteligentes organizados, eficientes e modulares.

### Conteúdo:

1. Herança
2. Polimorfismo
3. Funções `virtual`
4. Funções `override`
5. Exemplo Prático

---

## 1. Herança

### O que é Herança?

- **Definição**: Herança permite que novos contratos (filhos) herdem as propriedades e comportamentos de contratos existentes (pais).
- **Reutilização de Código**: Com a herança, evitamos duplicação de lógica em contratos relacionados, promovendo a organização em hierarquias.
- **Sintaxe**: Usamos a palavra-chave `is` para indicar que um contrato herda de outro.

#### Exemplo

```solidity
contract Filho is Pai {
    // O contrato Filho herda todas as propriedades e funções do contrato Pai.
}
```

---

## 2. Polimorfismo

### O que é Polimorfismo?

- **Definição**: Permite que funções com o mesmo nome tenham diferentes implementações em contratos diferentes.
- **Uso em Solidity**: Funções `virtual` e `override` são utilizadas para definir e sobrescrever comportamentos em contratos que utilizam herança.

---

## 3. Funções `virtual`

### Definindo Funções `virtual`

- **Descrição**: Em contratos pais, declaramos funções como `virtual` para permitir que contratos filhos modifiquem o comportamento dessas funções.
- **Quando Usar**: Use `virtual` para indicar que a função pode ser sobrescrita.
- **Sintaxe**: `function nomeDaFuncao() public virtual { ... }`

#### Exemplo

```solidity
contract Animal {
    function som() public virtual pure returns (string memory) {
        return "Som genérico de animal";
    }
}
```

---

## 4. Funções `override`

### Sobrescrevendo Funções com `override`

- **Descrição**: Contratos filhos utilizam `override` para modificar a implementação de funções `virtual` definidas no contrato pai.
- **Quando Usar**: Use `override` ao definir uma nova implementação para uma função herdada.
- **Sintaxe**: `function nomeDaFuncao() public override { ... }`

#### Exemplo

```solidity
contract Cachorro is Animal {
    function som() public override pure returns (string memory) {
        return "Au au!";
    }
}
```

---

## 5. Exemplo Prático

Neste exemplo, vamos criar uma hierarquia de contratos usando herança, onde `Animal` é o contrato pai, e `Cachorro` é um contrato filho que sobrescreve a função `som` do contrato pai.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Animal {
    function som() public virtual pure returns (string memory) {
        return "Som genérico de animal";
    }
}

contract Cachorro is Animal {
    function som() public override pure returns (string memory) {
        return "Au au!";
    }
}
```

- **Descrição**:
  - O contrato `Animal` define a função `som` como `virtual`, permitindo que seja sobrescrita.
  - O contrato `Cachorro` herda de `Animal` e utiliza `override` para fornecer uma implementação específica da função `som`.

---

## Vantagens da Herança e Polimorfismo

1. **Reutilização de Código**: Contratos filhos herdam funcionalidades do contrato pai, evitando a duplicação de código.
2. **Extensibilidade**: Contratos filhos podem expandir e modificar comportamentos herdados, facilitando a criação de sistemas complexos.
3. **Manutenibilidade**: Contratos organizados hierarquicamente são mais fáceis de entender e manter.
4. **Flexibilidade**: Funções `virtual` e `override` permitem uma maior adaptabilidade do código, ajustando comportamentos conforme necessário.

---

## Conclusão

Nesta aula, aprendemos a usar as palavras-chave `virtual` e `override` para implementar **Herança** e **Polimorfismo** em Solidity. Essas ferramentas são fundamentais para criar contratos organizados, reutilizáveis e flexíveis. Compreender e aplicar herança e polimorfismo permite desenvolver sistemas complexos e modulares de forma mais eficiente, aproveitando ao máximo o potencial da programação orientada a objetos em contratos inteligentes.

---

## Recapitulação

1. **Herança**:
   - Permite que contratos filhos herdem propriedades e comportamentos de contratos pais.
2. **Polimorfismo**:
   - Funções com o mesmo nome podem ter diferentes implementações em contratos diferentes.
3. **Funções `virtual`**:
   - Permitem que contratos filhos sobrescrevam seu comportamento.
4. **Funções `override`**:
   - Usadas para sobrescrever a implementação de uma função `virtual` no contrato pai.
5. **Exemplo Prático**:
   - Criamos uma hierarquia entre `Animal` e `Cachorro`, utilizando `virtual` e `override` para implementar polimorfismo.

---

## Lição de Casa

Crie um contrato chamado `Veiculo` com uma função `mover()` marcada como `virtual`. Em seguida, crie contratos `Carro` e `Bicicleta` que herdam de `Veiculo` e implementam `mover()` com diferentes mensagens. 

---

## Próxima Aula

Na próxima aula, vamos explorar o uso avançado de **chamadas externas** para criar sistemas ainda mais robustos em Solidity. Nos vemos lá!

---