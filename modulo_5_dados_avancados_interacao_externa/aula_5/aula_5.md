# Aula 5: **Controle de Acesso Baseado em Funções (RBAC)**

## Abertura

Bem-vindo à nossa aula sobre controle de acesso baseado em funções (RBAC) no Solidity! Até agora, você aprendeu sobre segurança e como criar contratos seguros e bem-estruturados. Hoje, vamos abordar uma técnica fundamental para proteger seu contrato: **Controle de Acesso Baseado em Funções (RBAC)**. Esse mecanismo de segurança permite restringir o acesso a certas funcionalidades do contrato com base nas permissões atribuídas a cada usuário, como administradores e usuários comuns.

### Programação:

1. Controle de Acesso
2. RBAC (Role-Based Access Control)
3. Implementando RBAC em Solidity
4. Exemplo Prático

---

## 1. Controle de Acesso

### O que é Controle de Acesso?

Controle de acesso é um conjunto de mecanismos que restringem o acesso a determinadas funções e dados do contrato, garantindo que apenas usuários autorizados possam realizar certas ações. Esse controle é fundamental para proteger os recursos do contrato e garantir que operações críticas sejam executadas apenas por usuários com as permissões adequadas.

### Diferentes Abordagens de Controle de Acesso

Existem várias abordagens para implementar controle de acesso em contratos Solidity, entre elas:

- **`onlyOwner`**: Restringe o acesso ao proprietário do contrato.
- **Whitelists**: Uma lista de endereços autorizados a executar certas funções.
- **RBAC (Role-Based Access Control)**: Define funções específicas com permissões e atribui essas funções aos usuários, oferecendo um controle de acesso mais granular e flexível.

---

## 2. RBAC (Role-Based Access Control)

### O que é RBAC?

RBAC (Role-Based Access Control) é uma técnica de controle de acesso em que cada usuário possui uma função (ou "role") associada que determina suas permissões no contrato. Esse método permite um controle mais detalhado sobre quem pode executar determinadas ações.

### Características do RBAC

- **Definição de Funções (Roles)**: Criamos funções que representam níveis de permissão, como administrador, usuário e convidado.
- **Mapeamento de Funções para Usuários**: Atribuímos funções específicas para cada endereço.
- **Controle Flexível e Granular**: Podemos facilmente definir quais ações cada função pode realizar, facilitando a gestão de acesso.

---

## 3. Implementando RBAC em Solidity

Vamos ver como implementar o RBAC no Solidity.

### Passo 1: Definir Funções com `enum`

Começamos definindo as funções permitidas no contrato. Nesse exemplo, vamos criar três funções: `ADMIN`, `USUARIO` e `CONVIDADO`.

```solidity
enum Funcao {
    ADMIN,
    USUARIO,
    CONVIDADO
}
```

### Passo 2: Mapeamento de Funções para Usuários

Criamos um `mapping` que armazena a função de cada usuário. Usaremos um `mapping` de endereços para `Funcao`, permitindo que cada endereço tenha uma função associada.

```solidity
mapping(address => Funcao) public funcoes;
```

### Passo 3: Modificadores para Restringir o Acesso

Usamos `modifiers` para restringir o acesso às funções do contrato. Esse modificador verificará a função do usuário antes de permitir a execução da função.

```solidity
modifier apenasAdmin() {
    require(funcoes[msg.sender] == Funcao.ADMIN, "Apenas administradores podem chamar esta funcao.");
    _;
}
```

---

## 4. Exemplo Prático

Aqui está um exemplo completo de um contrato que implementa RBAC. Esse contrato define funções para gerenciar usuários e restringir o acesso a uma função administrativa.

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
        funcoes[msg.sender] = Funcao.ADMIN; // Define o criador do contrato como ADMIN
    }

    modifier apenasAdmin() {
        require(funcoes[msg.sender] == Funcao.ADMIN, "Apenas administradores podem chamar esta funcao.");
        _;
    }

    function adicionarUsuario(address _usuario) public apenasAdmin {
        funcoes[_usuario] = Funcao.USUARIO;
    }

    function funcaoRestrita() public apenasAdmin {
        // Código que apenas o ADMIN pode executar
    }
}
```

### Explicação do Exemplo

1. **Função `adicionarUsuario`**:
   - Permite que o ADMIN adicione novos usuários ao sistema, atribuindo a função de `USUARIO` ao endereço fornecido.

2. **Função `funcaoRestrita`**:
   - Uma função que apenas o ADMIN pode acessar, protegida pelo modificador `apenasAdmin`.

---

## Conclusão

Nesta aula, aprendemos a implementar o Controle de Acesso Baseado em Funções (RBAC) em contratos Solidity. Essa técnica oferece uma camada de segurança importante, permitindo definir quem pode executar cada função no contrato, com base nas permissões atribuídas. Com o RBAC, você pode organizar melhor a estrutura de permissões dos seus contratos, garantindo que ações importantes só sejam executadas por usuários autorizados.

---

## Recapitulação

1. **Controle de Acesso**:
   - Importância de restringir o acesso a funções e dados do contrato para proteger recursos.
2. **RBAC (Role-Based Access Control)**:
   - Definir funções com permissões específicas para garantir controle de acesso flexível.
3. **Implementação do RBAC em Solidity**:
   - Como definir funções com `enum`, mapear essas funções para usuários e usar `modifiers` para controle de acesso.
4. **Exemplo Prático**:
   - Criamos um contrato com permissões específicas para `ADMIN` e `USUARIO`, demonstrando o controle de acesso granular em Solidity.

---

## Lição de Casa

Crie um contrato chamado `GestorDePermissoes` que inclua as funções de `ADMIN`, `EDITOR` e `LEITOR`. Permita que o `ADMIN` atribua ou remova funções dos usuários e restrinja uma função de escrita apenas ao `EDITOR`.

---

## Próximo módulo

No próximo módulo, falaremos de testes e processo de deploy do seu contrato.

---