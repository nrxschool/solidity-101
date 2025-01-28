// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArmazenamentoSimples {
    uint private numero;

    // Função para armazenar um número
    function armazenarNumero(uint _numero) public {
        numero = _numero;
    }

    // Função para recuperar o número armazenado
    function recuperarNumero() public view returns (uint) {
        return numero;
    }
}

contract BancoSimples {
    mapping(address => uint) private saldos;

    // Função para depositar Ether
    function depositar() public payable {
        saldos[msg.sender] += msg.value;
    }

    // Função para sacar Ether
    function sacar(uint valor) public {
        require(saldos[msg.sender] >= valor, "Saldo insuficiente.");
        saldos[msg.sender] -= valor;
        payable(msg.sender).transfer(valor);
    }

    // Função para consultar saldo
    function consultarSaldo() public view returns (uint) {
        return saldos[msg.sender];
    }
}

contract ControleDeAcesso {
    address public owner;
    uint private dadosSecretos;

    // Construtor que define o proprietário
    constructor(uint _dadosIniciais) {
        owner = msg.sender;
        dadosSecretos = _dadosIniciais;
    }

    // Função pública para atualizar dados (somente pelo proprietário)
    function atualizarDados(uint _novosDados) public somenteProprietario {
        dadosSecretos = _novosDados;
    }

    // Função privada auxiliar
    function calcularAlgo() private view returns (uint) {
        return dadosSecretos * 2;
    }

    // Função pública para obter o resultado do cálculo
    function obterResultado() public view returns (uint) {
        return calcularAlgo();
    }

    // Modificador para restringir acesso
    modifier somenteProprietario() {
        require(msg.sender == owner, unicode"Acesso negado: apenas o proprietário pode executar esta função.");
        _;
    }
}