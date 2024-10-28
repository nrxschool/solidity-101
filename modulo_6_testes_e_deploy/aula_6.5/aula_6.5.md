## Aula 6.5: Testes Unitários com Hardhat

**Objetivo:** Aprender a escrever testes unitários para seus contratos Solidity usando o Hardhat, garantindo a qualidade e a segurança do seu código.

**Conteúdo:**

- **Testes Unitários:**
    - Testes que verificam o comportamento de unidades individuais de código (funções).
    - Essenciais para garantir que o contrato funciona como esperado.
    - Detectam erros e vulnerabilidades antes do deploy.
    - Facilitam a manutenção e a refatoração do código.

- **TDD (Desenvolvimento Orientado a Testes):**
    - Metodologia de desenvolvimento onde os testes são escritos **antes** do código.
    - Ciclo do TDD:
        - Escrever um teste que falha.
        - Escrever o código mínimo para passar no teste.
        - Refatorar o código.
    - Vantagens do TDD:
        - Maior qualidade do código
        - Melhor design do código
        - Maior confiança no código
        - Facilidade de manutenção

- **Escrevendo Testes com Hardhat:**
    - Hardhat usa o framework Mocha para testes.
    - Arquivos de teste ficam na pasta `test/`.
    - Usar `describe` e `it` para organizar os testes.
    - Usar `expect` para fazer asserções sobre o resultado das funções.
    - Exemplo:

    ```javascript
    const { expect } = require("chai");
    const { ethers } = require("hardhat");

    describe("MeuContrato", function () {
      it("Deve retornar o valor correto", async function () {
        const MeuContrato = await ethers.getContractFactory("MeuContrato");
        const meuContrato = await MeuContrato.deploy();
        await meuContrato.deployed();

        expect(await meuContrato.meuValor()).to.equal(123);
      });
    });
    ```
