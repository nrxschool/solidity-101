## Aula 4.1: Funções em Solidity e o Construtor

**Objetivo:** Aprender a declarar e usar funções em Solidity, incluindo o construtor para inicializar o contrato.

**Conteúdo:**

- **Funções em Solidity:**
    - Blocos de código reutilizáveis que executam tarefas específicas.
    - Podem:
     > Modificar o estado do contrato.
     > Ler dados da blockchain.
     > Receber e enviar ether.
    
    - Sintaxe básica:

    ```solidity
    function nomeDaFuncao(parametros) modificadores visibilidade returns (tipoDeRetorno) {
        // Corpo da função
    }
    ```

    - Parâmetros: valores de entrada para a função.
    - Modificadores: alteram o comportamento da função.
    - Visibilidade: define quem pode chamar a função.
    - Tipo de retorno: tipo de dado que a função retorna.


- **Modificadores de Visibilidade**
  - **public**: acessível de dentro e fora do contrato.
  - **private**: acessível apenas de dentro do contrato.
  - **internal**: acessível de dentro do contrato e de contratos derivados.
  - **external**: acessível apenas de fora do contrato.

- **Funções `pure`, `view` e `payable`**
  - **view**: acessa, mas não modifica o estado do contrato.
  - **pure**: não acessa nem modifica o estado do contrato, usando apenas variáveis locais.
  - **payable**: permite que a função receba ether, essencial em contratos que lidam com pagamentos.

- **Construtora:**
    - Função especial executada apenas uma vez durante a criação do contrato.
    - Usado para inicializar o estado do contrato.
    - Nome do construtor: `constructor`.
    - Pode receber parâmetros.