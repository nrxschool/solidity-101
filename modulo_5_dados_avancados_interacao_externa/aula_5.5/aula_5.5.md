## Aula 5.5: `fallback` e `receive`: Recebendo Ether

**Objetivo:**  Compreender as funções especiais `fallback` e `receive` em Solidity e como elas permitem que seus contratos recebam Ether de forma personalizada.

**Conteúdo:**

- **Recebendo Ether:**
    - Contratos podem receber Ether diretamente, mesmo sem uma função dedicada para isso.
    - As funções `fallback` e `receive` permitem definir um comportamento personalizado para quando o contrato recebe Ether.
    - Essas funções são opcionais, mas podem ser úteis para:
        - Registrar o recebimento de Ether
        - Executar alguma lógica quando o contrato recebe Ether
        - Rejeitar o recebimento de Ether em certas condições

- **Função `receive`:**
    - É chamada quando o contrato recebe Ether **sem calldata** (dados na transação).
    - Deve ser declarada como `external payable` e **não pode ter argumentos nem retornar valores**.
    - Exemplo:

    ```solidity
    receive() external payable {
        emit EtherRecebido(msg.sender, msg.value);
    }
    ```

- **Função `fallback`:**
    - É chamada em duas situações:
        - Quando o contrato recebe Ether **com calldata** que não corresponde a nenhuma função.
        - Quando nenhuma das outras funções corresponde à calldata.
    - Pode ser declarada como `external payable` ou `external`.
    - Pode ter argumentos e retornar valores, mas é **limitada em termos de gás**.
    - Exemplo:

    ```solidity
    fallback() external payable {
        // Lógica para lidar com a calldata
    }
    ```

- **Diferenças entre `fallback` e `receive`:**

    | Característica | `receive` | `fallback` |
    |---|---|---|
    | Calldata | Sem calldata | Com calldata ou quando nenhuma função corresponde |
    | Argumentos | Não pode ter | Pode ter |
    | Retorno | Não pode retornar valores | Pode retornar valores |
    | Gas Limitado | Não | Sim |

- **Escolhendo entre `fallback` e `receive`:**
    - Use `receive` quando o contrato precisa apenas receber Ether.
    - Use `fallback` quando o contrato precisa lidar com calldata ou executar lógica mais complexa.

**Código (Exemplo):**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract RecebedorDeEther {
    event EtherRecebido(address remetente, uint valor);

    receive() external payable {
        emit EtherRecebido(msg.sender, msg.value);
    }

    fallback() external payable {
        // Lógica para lidar com a calldata
    }
}
``