## Aula 4.2: Eventos: Notificando o Mundo Exterior

**Objetivo:** Aprender a usar eventos em Solidity para registrar e comunicar informações importantes sobre a execução do contrato.

**Conteúdo:**

- **Eventos em Solidity:**
    - Mecanismo para registrar informações na blockchain.
    - Permitem que aplicações externas monitorem o contrato e reajam a eventos específicos.
    - Análogos a "logs" que fornecem informações sobre o que aconteceu no contrato.
    - Sintaxe básica:

    ```solidity
    event NomeDoEvento(parametros);
    ```

    - Parâmetros: informações que serão registradas junto com o evento.

- **Emitindo Eventos:**
    - Palavra-chave `emit` seguida do nome do evento e seus parâmetros.
    - Exemplo:

    ```solidity
    emit Transferencia(msg.sender, _to, _amount);
    ```

- **Escutando Eventos:**
    - Aplicações externas (ex: front-ends, dApps) podem "escutar" eventos emitidos pelo contrato.
    - Bibliotecas como Web3.js e Ethers.js fornecem interfaces para escutar eventos.
    - Permite que as aplicações reajam em tempo real às mudanças no contrato.

- **Exemplos de Uso:**
    - Registrar transferências de tokens (ERC-20).
    - Notificar a criação de um novo NFT (ERC-721).
    - Indicar a mudança de estado em um contrato de votação.
    - Registrar o resultado de um jogo.
