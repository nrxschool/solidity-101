# Aula 2: **Contratos Abstratos e Interfaces: Definindo um Modelo**

## Abertura

Bem-vindo à aula 2 do curso de Solidity! Nesta aula, vamos explorar os **Contratos Abstratos** e as **Interfaces** em Solidity, que são fundamentais para definir modelos e padrões em contratos inteligentes. Contratos abstratos e interfaces oferecem flexibilidade para criar contratos extensíveis, facilitando a implementação de padrões que ajudam na interoperabilidade entre diferentes contratos. Vamos entender como utilizá-los para organizar e estruturar melhor nossos projetos.

### Programação:

1. Contratos Abstratos
2. Interfaces
3. Diferenças entre Contratos Abstratos e Interfaces
4. Casos de Uso para Contratos Abstratos e Interfaces

---

## 1. Contratos Abstratos

### O que são Contratos Abstratos?

- **Definição**: Contratos que contêm pelo menos uma função sem implementação (ou seja, uma função abstrata) e não podem ser instanciados diretamente.
- **Uso**: Servem como um modelo ou base para outros contratos, definindo uma estrutura básica e comportamentos que devem ser seguidos.
- **Características**:
  - Podem ter funções com e sem implementação.
  - Podem incluir variáveis de estado, construtores e lógica compartilhada.

### Exemplo de Contrato Abstrato

```solidity
abstract contract Animal {
    string public nome;

    function som() public virtual pure returns (string memory);
}
```

- **Descrição**: Esse contrato abstrato `Animal` define uma estrutura para qualquer tipo de animal, com uma função abstrata `som()` que deve ser implementada em contratos filhos.

---

## 2. Interfaces

### O que são Interfaces?

- **Definição**: Um tipo especial de contrato que define um conjunto de funções que devem ser implementadas, mas sem nenhuma lógica ou implementação própria.
- **Uso**: Ideal para definir padrões e garantir que contratos que seguem a interface tenham um conjunto de funções consistentes, garantindo a interoperabilidade.
- **Características**:
  - Não podem ter implementações de funções.
  - Não podem ter variáveis de estado ou construtores.
  - São úteis para garantir que diferentes contratos sigam um padrão de interface.

### Exemplo de Interface

```solidity
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    // ... outras funções
}
```

- **Descrição**: Esta interface `IERC20` é um exemplo de padrão para contratos de tokens. Qualquer contrato que implemente `IERC20` precisa definir essas funções, garantindo compatibilidade com o padrão de token ERC20.

---

## 3. Diferenças entre Contratos Abstratos e Interfaces

| Característica         | Contrato Abstrato                        | Interface                             |
|------------------------|------------------------------------------|---------------------------------------|
| Implementação          | Pode ter funções com implementação       | Não pode ter nenhuma implementação    |
| Variáveis de Estado    | Pode ter                                 | Não pode ter                          |
| Herança                | Pode herdar de outros contratos e interfaces | Pode herdar de outras interfaces    |
| Construtores           | Pode ter                                 | Não pode ter                          |

---

## 4. Casos de Uso para Contratos Abstratos e Interfaces

### Quando usar Contratos Abstratos?

- **Propósito**: Para definir uma estrutura base com algumas funções já implementadas que podem ser reutilizadas.
- **Exemplo de Aplicação**: Se você está criando uma hierarquia onde deseja que alguns contratos compartilhem lógica básica, mas cada contrato filho defina seu comportamento específico para certas funções.

### Quando usar Interfaces?

- **Propósito**: Para definir um conjunto de funções que diferentes contratos devem implementar, garantindo um padrão comum.
- **Exemplo de Aplicação**: Criar um padrão de token (como ERC20) onde qualquer contrato que implemente essa interface seja compatível com o padrão.

---

## Conclusão

Nesta aula, vimos como os **Contratos Abstratos** e as **Interfaces** são ferramentas valiosas para definir modelos e padrões em Solidity. Os contratos abstratos nos permitem criar modelos que os contratos filhos devem estender e implementar, permitindo a criação de estruturas modulares e reutilizáveis. Por outro lado, as interfaces garantem que diferentes contratos sigam padrões específicos, essenciais para a interoperabilidade em aplicativos descentralizados.

Com esses conceitos, você pode estruturar melhor seus contratos, facilitando a manutenção e garantindo que sigam padrões de mercado.

---

## Recapitulação

1. **Contratos Abstratos**:
   - Definem uma estrutura de base e podem ter algumas implementações de funções.
2. **Interfaces**:
   - Definem um conjunto de funções sem implementação, garantido um padrão comum.
3. **Diferenças entre Contratos Abstratos e Interfaces**:
   - Contratos abstratos podem ter implementações, variáveis de estado e construtores; interfaces não.
4. **Casos de Uso**:
   - Contratos Abstratos para herança com lógica compartilhada.
   - Interfaces para garantir a interoperabilidade e padrões comuns entre contratos.

---

## Lição de Casa

Crie um contrato abstrato chamado `Veiculo` com uma função `mover()`. Depois, crie um contrato `Carro` que herda de `Veiculo` e implemente a função `mover()` para que ela retorne `"O carro está se movendo"`. Em seguida, crie uma interface chamada `IVeiculo` com a função `mover()` e faça o contrato `Carro` implementar esta interface também.

---

## Próxima Aula

Na próxima aula, vamos aprender sobre **Herança** em Solidity.

---