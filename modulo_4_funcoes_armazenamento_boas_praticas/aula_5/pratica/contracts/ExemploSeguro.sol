// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ExemploSeguro {
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

    // Modificador para restringir acesso apenas ao proprietário
    modifier onlyOwner() {
        require(msg.sender == owner, "Apenas o proprietario pode chamar esta funcao.");
        _;
    }

    function modificarValor(uint256 _novoValor) public onlyOwner {
        require(_novoValor > 0, "O novo valor deve ser maior que zero.");
        valor = _novoValor;
    }

    function mudarEstado(bool _novoEstado) public {
        assert(estado != _novoEstado); // Verifica se o estado é diferente do atual
        estado = _novoEstado;
    }

    function sacar(uint256 _quantia) public onlyOwner {
        if (address(this).balance < _quantia) {
            revert("Saldo insuficiente.");
        }
        payable(msg.sender).transfer(_quantia);
    }

    // Função para chamar um contrato externo, com tratamento de erros usando try/catch
    function chamarContratoExterno(address _contrato, bytes memory _dados) public {
        try IERC20(_contrato).transfer(msg.sender, 1) {
            emit TransferSuccess(_contrato, msg.sender);
        } catch Error(string memory reason) {
            emit TransferFailure(_contrato, msg.sender, reason);
        } catch (bytes memory /* lowLevelData */) {
            emit TransferFailure(_contrato, msg.sender, "Erro desconhecido.");
        }
    }
}

// Interface IERC20 para interagir com o contrato externo
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

// 1. Criar um token e publicar
// 2. Publicar o exemplo seguro e interagir com ele