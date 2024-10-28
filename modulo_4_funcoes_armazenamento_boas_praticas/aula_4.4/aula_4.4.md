## Aula 4.4: Escrevendo Código Seguro

**Objetivo:** Aprender técnicas para escrever código Solidity mais seguro, utilizando validação, tratamento de erros e modificadores.

**Conteúdo:**

- **Escrevendo Código Seguro:**
    - Erros em contratos podem ter consequências graves, como perda de fundos ou falhas de segurança.
    - Técnicas para aumentar a segurança:
        - Validação de entrada
        - Tratamento de erros
        - Uso de modificadores
        - Auditorias de código
        - Boas práticas de programação

- **Validação e Tratamento de Erros:**
    - `require(condicao, "mensagem de erro")`: verifica se uma condição é verdadeira. Se não for, reverte a transação com uma mensagem de erro.
    - `assert(condicao)`: verifica se uma condição é verdadeira. Se não for, causa um erro irrecuperável (panic). Usado para detectar erros internos no contrato.
    - `revert("mensagem de erro")`: reverte a transação com uma mensagem de erro.
    - `try/catch`: permite capturar e tratar erros em chamadas externas a outros contratos.

- **Modificadores:**
    - Funções que modificam o comportamento de outras funções.
    - Podem ser usados para:
        - Validar entrada
        - Controlar acesso
        - Reutilizar código
    - Exemplos:

    ```solidity
    modifier onlyOwner() {
        require(msg.sender == owner, "Apenas o proprietário pode chamar esta função.");
        _; // Executa a função modificada
    }

    function minhaFuncao() public onlyOwner {
        // ...
    }
    ```
