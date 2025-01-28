// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract EjemploSeguro {
    address public owner;
    uint256 public valor;
    bool public estado;

    event TransferSuccess(address indexed token, address indexed to);
    event TransferFailure(address indexed token, address indexed to, string reason);

    constructor() {
        owner = msg.sender;
        valor = 100;
        estado = true;
    }

    // Modificador para restringir acceso solo al propietario
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede llamar esta funcion.");
        _;
    }

    function modificarValor(uint256 _nuevoValor) public onlyOwner {
        require(_nuevoValor > 0, "El nuevo valor debe ser mayor que cero.");
        valor = _nuevoValor;
    }

    function cambiarEstado(bool _nuevoEstado) public {
        assert(estado != _nuevoEstado); // Verifica si el estado es diferente al actual
        estado = _nuevoEstado;
    }

    function retirar(uint256 _cantidad) public onlyOwner {
        if (address(this).balance < _cantidad) {
            revert("Saldo insuficiente.");
        }
        payable(msg.sender).transfer(_cantidad);
    }

    // Función para llamar a un contrato externo, con manejo de errores usando try/catch
    function llamarContratoExterno(address _contrato, bytes memory _datos) public {
        try IERC20(_contrato).transfer(msg.sender, 1) {
            emit TransferSuccess(_contrato, msg.sender);
        } catch Error(string memory reason) {
            emit TransferFailure(_contrato, msg.sender, reason);
        } catch (bytes memory /* lowLevelData */) {
            emit TransferFailure(_contrato, msg.sender, "Error desconocido.");
        }
    }
}

// Interfaz IERC20 para interactuar con el contrato externo
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

// 1. Crear un token y desplegarlo
// 2. Desplegar el EjemploSeguro e interactuar con él
