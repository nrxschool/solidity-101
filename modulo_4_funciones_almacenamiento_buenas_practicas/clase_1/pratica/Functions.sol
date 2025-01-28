// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AlmacenamientoSimple {
    uint private numero;

    // Función para almacenar un número
    function almacenarNumero(uint _numero) public {
        numero = _numero;
    }

    // Función para recuperar el número almacenado
    function recuperarNumero() public view returns (uint) {
        return numero;
    }
}

contract BancoSimple {
    mapping(address => uint) private saldos;

    // Función para depositar Ether
    function depositar() public payable {
        saldos[msg.sender] += msg.value;
    }

    // Función para retirar Ether
    function retirar(uint valor) public {
        require(saldos[msg.sender] >= valor, "Saldo insuficiente.");
        saldos[msg.sender] -= valor;
        payable(msg.sender).transfer(valor);
    }

    // Función para consultar el saldo
    function consultarSaldo() public view returns (uint) {
        return saldos[msg.sender];
    }
}

contract ControlDeAcceso {
    address public propietario;
    uint private datosSecretos;

    // Constructor que define al propietario
    constructor(uint _datosIniciales) {
        propietario = msg.sender;
        datosSecretos = _datosIniciales;
    }

    // Función pública para actualizar datos (solo por el propietario)
    function actualizarDatos(uint _nuevosDatos) public soloPropietario {
        datosSecretos = _nuevosDatos;
    }

    // Función privada auxiliar
    function calcularAlgo() private view returns (uint) {
        return datosSecretos * 2;
    }

    // Función pública para obtener el resultado del cálculo
    function obtenerResultado() public view returns (uint) {
        return calcularAlgo();
    }

    // Modificador para restringir acceso
    modifier soloPropietario() {
        require(msg.sender == propietario, unicode"Acceso denegado: solo el propietario puede ejecutar esta función.");
        _;
    }
}
