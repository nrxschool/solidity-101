## Aula 4.4: Modificadores de Variáveis

**Objetivo:** Aprender a usar os modificadores `constant` e `immutable` para declarar variáveis com valores fixos em Solidity.

**Conteúdo:**

- **Modificadores de Variáveis:**
    - `constant` e `immutable` permitem declarar variáveis com valores fixos.
    - Essas variáveis não podem ser modificadas após a inicialização.
    - Úteis para definir valores que não mudam durante a execução do contrato, como taxas, endereços de outros contratos ou parâmetros de configuração.
    - Otimizam o contrato, economizando gás e espaço de armazenamento.

- **`constant`:**
    - Uma variável `constant` deve ser inicializada com um valor no momento da declaração.
    - O valor deve ser conhecido em tempo de compilação (valor literal ou expressão computável pelo compilador).
    - Exemplo:

    ```solidity
    uint256 public constant TAXA = 10; // Valor fixo da taxa
    ```

- **`immutable`:**
    - Uma variável `immutable` pode ser inicializada apenas uma vez, durante a construção do contrato.
    - O valor pode ser determinado em tempo de execução, permitindo o uso de valores dinâmicos.
    - Exemplo:

    ```solidity
    address public immutable owner; // Endereço do proprietário do contrato

    constructor() {
        owner = msg.sender; // Inicializa com o endereço do criador do contrato
    }
    ```

- **Diferenças entre `constant` e `immutable`:**

    | Característica | `constant` | `immutable` |
    |---|---|---|
    | Inicialização | Na declaração | No construtor |
    | Tempo de Determinação do Valor | Tempo de compilação | Tempo de execução |
    | Local de Armazenamento | Substituído no código | Código do contrato |

- **Vantagens:**
    - Economia de gás: as variáveis `constant` e `immutable` não ocupam espaço no storage.
    - Otimização de código: o compilador pode otimizar o código, substituindo as variáveis pelos seus valores.
    - Segurança: evita modificações acidentais de valores importantes.
