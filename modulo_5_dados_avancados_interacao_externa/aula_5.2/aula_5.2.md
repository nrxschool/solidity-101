## Aula 5.2: Contratos Abstratos e Interfaces: Definindo um Modelo

**Objetivo:**  Compreender o conceito de contratos abstratos e interfaces em Solidity e como eles auxiliam na definição de modelos e padrões para outros contratos.

**Conteúdo:**

- **Contratos Abstratos:**
    - São contratos que não podem ser instanciados diretamente.
    - Devem conter pelo menos uma função abstrata (sem implementação).
    - Servem como modelos para outros contratos, definindo uma estrutura básica e comportamentos comuns.
    - Exemplo:

    ```solidity
    abstract contract Animal {
        string public nome;

        function som() public virtual pure returns (string memory);
    }
    ```

- **Interfaces:**
    - Semelhantes aos contratos abstratos, mas não podem ter nenhuma implementação.
    - Definem um conjunto de funções que os contratos que a implementam devem ter.
    - Úteis para definir padrões e garantir a interoperabilidade entre contratos.
    - Exemplo:

    ```solidity
    interface IERC20 {
        function totalSupply() external view returns (uint256);
        function balanceOf(address account) external view returns (uint256);
        function transfer(address recipient, uint256 amount) external returns (bool);
        // ... outras funções
    }
    ```

- **Diferenças entre Contratos Abstratos e Interfaces:**

    | Característica | Contrato Abstrato | Interface |
    |---|---|---|
    | Implementação | Pode ter funções com implementação | Não pode ter nenhuma implementação |
    | Variáveis de Estado | Pode ter | Não pode ter |
    | Herança | Pode herdar de outros contratos e interfaces | Pode herdar de outras interfaces |
    | Construtores | Pode ter | Não pode ter |

- **Quando usar Contratos Abstratos:**
    - Para definir uma estrutura base com algumas funções já implementadas.
    - Quando a lógica de algumas funções precisa ser definida pelos contratos filhos.

- **Quando usar Interfaces:**
    - Para definir um padrão de funções que os contratos devem seguir.
    - Quando se deseja garantir a interoperabilidade entre diferentes contratos.

