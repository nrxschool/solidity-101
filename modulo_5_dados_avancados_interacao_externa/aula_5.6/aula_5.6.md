## Aula 5.6: Controle de Acesso Baseado em Funções (RBAC)

**Objetivo:** Aprender a implementar controle de acesso baseado em funções (RBAC) em contratos Solidity, restringindo o acesso a determinadas funcionalidades com base nas funções dos usuários.

**Conteúdo:**

- **Controle de Acesso:**
    - Mecanismos para restringir o acesso a funções e dados do contrato.
    - Importante para proteger o contrato e garantir que apenas usuários autorizados possam realizar determinadas ações.
    - Diferentes abordagens:
        - `onlyOwner`: restringe o acesso ao proprietário do contrato.
        - Whitelists: lista de endereços autorizados.
        - RBAC: controle de acesso baseado em funções.

- **RBAC (Role-Based Access Control):**
    - Define funções (roles) com permissões específicas.
    - Usuários são atribuídos a funções.
    - Permite um controle de acesso mais granular e flexível.

- **Implementando RBAC em Solidity:**
    - Usar `enums` para definir as funções:

    ```solidity
    enum Funcao {
        ADMIN,
        USUARIO,
        CONVIDADO
    }
    ```

    - Usar um `mapping` para armazenar as funções dos usuários:

    ```solidity
    mapping(address => Funcao) public funcoes;
    ```

    - Usar `modifiers` para restringir o acesso a funções:

    ```solidity
    modifier apenasAdmin() {
        require(funcoes[msg.sender] == Funcao.ADMIN, "Apenas administradores podem chamar esta funcao.");
        _;
    }
    ```

- **Exemplo de Uso:**

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.27;

    contract RBAC {
        enum Funcao {
            ADMIN,
            USUARIO
        }

        mapping(address => Funcao) public funcoes;

        constructor() {
            funcoes[msg.sender] = Funcao.ADMIN;
        }

        modifier apenasAdmin() {
            require(funcoes[msg.sender] == Funcao.ADMIN, "Apenas administradores podem chamar esta funcao.");
            _;
        }

        function adicionarUsuario(address _usuario) public apenasAdmin {
            funcoes[_usuario] = Funcao.USUARIO;
        }

        function funcaoRestrita() public apenasAdmin {
            // ...
        }
    }
    ```