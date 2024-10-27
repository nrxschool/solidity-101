## Aula 4.3: Armazenamento de Dados: Memory, Calldata e Storage

**Objetivo:**  Entender os diferentes tipos de armazenamento de dados em Solidity (memory, calldata e storage) e como eles afetam o comportamento e a eficiência dos contratos.

**Conteúdo:**

- **Onde seus Dados Residem?**
    - Solidity oferece três locais para armazenar dados:
        - **Storage:** Armazenamento persistente na blockchain.
            > É a localização de dados padrão para **variáveis de estado** (variáveis declaradas **fora de funções e dentro do escopo do contrato**). O armazenamento é persistente e **caro em termos de consumo de gás** para **modificar ou interagir com ele**. As variáveis de armazenamento são armazenadas no estado do contrato e sobrevivem a chamadas de função e transações.
            > São armazenadas no espaço de storage, no blockchain, associado a um endereço de contrato. Cada nó terá uma cópia de tudo que é armazenado no storage
        - **Memory:** Armazenamento temporário em memória.
            > É uma área de armazenamento temporária e mais barata que **`storage`**. Variáveis na memória são armazenadas apenas durante a execução de uma função e são apagadas após a função retornar.
            > Usadas em variáveis locais de funções que não são de estado são armazenadas na memória por padrão. Você pode **especificar explicitamente a localização de dados como `memory` para parâmetros e variáveis de retorno de função.**
        - **Calldata:**  Espaço de memória temporário e não modificável para parâmetros de funções externas.
            > É uma área de armazenamento **imutável** e específica para os **dados de entrada (argumentos) de uma função chamada externa.** O calldata é usado quando uma função é chamada externamente ao contrato, como quando um usuário interage com o contrato por meio de uma transação. 
            > Os dados do calldata são gravados no blockchain como parte da transação, mas não são armazenados permanentemente no contrato É mais barato em termos de gás do que **`memory`**, pois é apenas para leitura e não permite modificações.
    
    - A escolha do local de armazenamento impacta:
        - Custo de gás
        - Visibilidade dos dados
        - Persistência dos dados

- **Storage:**
    - Local de armazenamento **permanente** na blockchain.
    - Usado para variáveis de estado do contrato.
    - **Custo alto de escrita**, mas leitura mais barata.
    - Dados persistem entre chamadas de funções.
    - Exemplo:

    ```solidity
    contract MeuContrato {
        uint public meuNumero; // Armazenado em storage
    }
    ```

- **Memory:**
    - Local de armazenamento **temporário** na memória.
    - Usado para variáveis locais dentro de funções.
    - **Mais barato que storage**, tanto para leitura quanto para escrita.
    - Dados são apagados após a execução da função.
    - Exemplo:

    ```solidity
    function minhaFuncao(uint _numero) public pure returns (uint) {
        uint novoNumero = _numero * 2; // Armazenado em memory
        return novoNumero;
    }
    ```

- **Calldata:**
    - Local de armazenamento **temporário** e **não modificável**.
    - Usado para parâmetros de funções externas.
    - Semelhante à memory em termos de custo.
    - Impede modificações acidentais dos dados de entrada.
    - Exemplo:

    ```solidity
    function minhaFuncao(uint[] calldata _numeros) public pure returns (uint) {
        // ...
    }
    ```