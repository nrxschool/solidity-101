# Aula 4: **Projeto Prático: Loteria Simples em Solidity**

## Abertura

Bem-vindo à Aula 4! Nesta aula, vamos desenvolver um contrato inteligente de **loteria**. Esse projeto prático ajudará você a entender conceitos de **pagamentos, sorteios aleatórios simulados e controle de fluxo** em Solidity. Este é um ótimo exemplo para consolidar conceitos fundamentais enquanto construímos uma aplicação descentralizada.

### Programação:

1. Estrutura Básica de um Contrato de Loteria
2. Implementando as Funções de Participação e Sorteio
3. Passo a Passo para Compilar e Implantar o Contrato

---

## 1. Estrutura Básica de um Contrato de Loteria

### Conceito

Uma loteria simples funciona da seguinte maneira:
- **Participantes** compram bilhetes enviando uma quantia fixa de Ether para o contrato.
- **Sorteio**: Uma função especial escolhe aleatoriamente um vencedor de entre os participantes.
- **Distribuição de Prêmio**: O vencedor recebe o valor total acumulado no contrato.

### Variáveis e Funções Necessárias

- **Variáveis de Estado**:
  - `dono`: Endereço do dono do contrato que administra o sorteio.
  - `participantes`: Array que armazena os endereços de todos os participantes.

- **Funções Principais**:
  - `participar`: Permite que um usuário compre um bilhete enviando Ether.
  - `sortearVencedor`: Realiza o sorteio e transfere o prêmio para o vencedor (restrita ao dono).
  - `getParticipantes`: Retorna a lista de participantes.

---

## 2. Implementando o Contrato de Loteria

### Código do Contrato `LoteriaSimples.sol`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract LoteriaSimples {
    address public dono;
    address[] public participantes;

    constructor() {
        dono = msg.sender;
    }

    // Função para participar da loteria
    function participar() public payable {
        require(msg.value == 0.01 ether, "O valor de participacao e de 0.01 Ether.");
        participantes.push(msg.sender);
    }

    // Função para realizar o sorteio e transferir o prêmio
    function sortearVencedor() public apenasDono {
        require(participantes.length > 0, "Nao ha participantes.");
        uint indiceVencedor = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, participantes))) % participantes.length;
        address vencedor = participantes[indiceVencedor];

        // Transferir o valor total do contrato para o vencedor
        payable(vencedor).transfer(address(this).balance);

        // Resetar a lista de participantes
        delete participantes;
    }

    // Modifier para restringir a função ao dono
    modifier apenasDono() {
        require(msg.sender == dono, "Apenas o dono pode chamar esta funcao.");
        _;
    }

    // Função para retornar o número de participantes
    function getParticipantes() public view returns (uint) {
        return participantes.length;
    }
}
```

- **Descrição do Contrato**:
  - **participar**: Recebe exatamente 0.01 Ether e registra o participante.
  - **sortearVencedor**: Gera um índice pseudo-aleatório, escolhe um vencedor e transfere o saldo do contrato.
  - **Modifier apenasDono**: Restringe a função `sortearVencedor` ao dono do contrato.
  - **getParticipantes**: Retorna a quantidade de participantes atuais.

---

## 3. Passo a Passo do Projeto

### Passo 1: Criar o Projeto com Hardhat

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

### Passo 2: Adicionar o Contrato `LoteriaSimples.sol`

Na pasta `contracts/`, adicione o contrato `LoteriaSimples.sol` com o código acima.

---

### Passo 3: Compilar o Contrato

Compile o contrato para verificar a existência de erros:

```bash
npx hardhat compile
```

---

### Passo 4: Criar um Script de Deploy para o Contrato

Crie um arquivo de deploy chamado `deployLoteria.js` em `scripts/`:

```javascript
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("LoteriaSimples", (m) => {
  const loteriaSimples = m.contract("LoteriaSimples");

  return { loteriaSimples };
});
```

---

### Passo 5: Implantar o Contrato em um Nó Local

1. Inicie um nó local com o Hardhat:

   ```bash
   npx hardhat node
   ```

2. Execute o deploy do contrato:

   ```bash
   npx hardhat ignition deploy --network localhost
   ```

---

## Conclusão

Hoje construímos uma **loteria simples em Solidity**, cobrindo os principais conceitos de **pagamentos, sorteio e controle de acesso**. Esse exemplo prático demonstrou como organizar funções e variáveis para criar uma aplicação funcional e divertida.

---

## Recapitulação

1. **Estrutura do Contrato**:
   - Funções para participação e sorteio, além do uso de modificadores de acesso.
2. **Passo a Passo para Criar o Projeto**:
   - Desenvolvimento e deploy do contrato usando o Hardhat.
3. **Próximos Passos**:
   - Implementar melhorias, como restrições de tempo ou aumento do prêmio conforme a quantidade de participantes.

---

## Lição de Casa

Adicione uma função que permite ao dono configurar a quantidade de Ether necessária para participar da loteria e verifique essa configuração na função `participar`.

---

## Próxima Aula

Na próxima aula, vamos explorar a implementação de um contrato de **crowdfunding**, aplicando conceitos como governança e limites de tempo.

---