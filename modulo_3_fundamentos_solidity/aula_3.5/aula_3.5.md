## Aula 4: Anatomia de um Contrato Solidity

**Objetivo**: Entender a estrutura básica de um contrato Solidity, incluindo a definição de licenças, pragmas, imports, comentários, variáveis de estado e o construtor.


### 1. SPDX License Identifier

O SPDX License Identifier é um identificador padrão que especifica a licença sob a qual o contrato é publicado. Adicionar o SPDX ajuda a esclarecer o tipo de licença, facilitando a revisão e conformidade do código.

```solidity
// SPDX-License-Identifier: MIT
```

- O identificador de licença, como "MIT", está relacionado às permissões de uso e modificação do código.
- Exemplo de licenças comuns: MIT, GPL-3.0, Apache-2.0.

---

### 2. Pragmas

O **pragma** indica a versão mínima do compilador Solidity necessária para compilar o contrato, ajudando a garantir que o código seja executado corretamente em versões suportadas.

```solidity
pragma solidity ^0.8.0;
```

- Um número de versão específico, como 0.8.17. Isso indica que o contrato deve ser compilado exatamente com essa versão.
- Um intervalo de versões, usando os operadores ^ ou >=.
  > ^0.8.0: indica que o contrato pode ser compilado com qualquer versão maior ou igual a 0.8.0 e menor que 0.9.0. Essa é a forma mais comum e recomendada, pois permite aproveitar correções de bugs e melhorias de performance em versões mais novas da série 0.8.x, sem correr o risco de incompatibilidades com versões futuras.
  > >=0.7.0: indica que o contrato pode ser compilado com qualquer versão maior ou igual a 0.7.0. Essa forma é menos restritiva, mas pode levar a problemas de compatibilidade com versões mais novas.

---

### 3. Imports

O **import** permite a inclusão de outros contratos e bibliotecas Solidity, organizando melhor o código e facilitando a reutilização.

```solidity
import "@openzeppelin/contracts/access/Ownable.sol";
```

- O OpenZeppelin, por exemplo, é um conjunto de contratos padrão e seguros amplamente usado.

---

### 4. Comentários: Documentação no Código

Comentários ajudam a descrever o que cada parte do contrato faz, tornando o código mais legível e fácil de entender.

- **Comentários de Linha**:
  ```solidity
  // Este é um comentário de linha única
  ```

- **Comentários de Bloco**:
  ```solidity
  /*
     Este é um comentário de bloco.
  */
  ```

- **Comentários do NatSpec** (usados para documentar funções e variáveis):
  ```solidity
  /// @notice Retorna o saldo do usuário
  /// @param _usuario O endereço do usuário
  /// @return saldo O saldo atual do usuário
  ```

---

### 5. Definição do Contrato e Variáveis de Estado

A definição do contrato é onde declaramos o nome do contrato e as variáveis de estado, que representam dados armazenados na blockchain.

```solidity
contract ExemploContrato {
    
    // Variáveis de estado
    address public owner;
    uint256 public balance;

    // Comentário para descrever o propósito de cada variável
    // `owner`: endereço do dono do contrato
    // `balance`: saldo total do contrato
}
```

- **Variáveis de Estado**: Armazenadas permanentemente na blockchain, persistindo entre execuções e transações.

---

### 6. Construtor

O **construtor** é uma função especial que é executada uma única vez, na criação do contrato. Ele é usado para inicializar variáveis e definir as condições iniciais do contrato.

```solidity
constructor() {
    owner = msg.sender; // Define o dono do contrato como quem o criou
    balance = 0;        // Inicializa o saldo com zero
}
```

- `msg.sender`: refere-se ao endereço que implantou o contrato.
- **Construtores** são opcionais, mas são úteis para definir configurações iniciais.


