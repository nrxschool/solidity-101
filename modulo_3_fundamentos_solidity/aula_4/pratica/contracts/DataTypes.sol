// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DataTypes {

  // Enum para representar o status de um usuário
    enum Status { 
        Ativo, // Status.Ativo = 0
        Inativo, // Status.Inativo = 1
        Suspenso // Status.Suspenso = 2
    }

    // Mapping para associar um endereço de usuário ao seu status atual
    mapping(address => Status) public statusUsuarios;

    // Array dinâmico para armazenar uma lista de endereços de usuários
    address[] public listaUsuarios;

    function adicionarUsuario(address _usuario) public {
        listaUsuarios.push(_usuario); 
        statusUsuarios[_usuario] = Status.Ativo; 
    }

    function alterarStatus(address _usuario, Status _novoStatus) public {
        statusUsuarios[_usuario] = _novoStatus; 
    }

    function obterStatus(address _usuario) public view returns (Status) {
        return statusUsuarios[_usuario];
    }

    function _existeUsuario(address _usuario) private view returns (bool) {
        for (uint i = 0; i < listaUsuarios.length; i++) {
            if (listaUsuarios[i] == _usuario) {
                return true;
            }
        }
        return false;
    }
}
