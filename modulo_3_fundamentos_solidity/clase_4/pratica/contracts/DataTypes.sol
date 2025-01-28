// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract TiposDeDatos {

    // Enum para representar el estado de un usuario
    enum Estado { 
        Activo, // Estado.Activo = 0
        Inactivo, // Estado.Inactivo = 1
        Suspendido // Estado.Suspendido = 2
    }

    // Mapping para asociar una dirección de usuario a su estado actual
    mapping(address => Estado) public estadoUsuarios;

    // Array dinámico para almacenar una lista de direcciones de usuarios
    address[] public listaUsuarios;

    function agregarUsuario(address _usuario) public {
        listaUsuarios.push(_usuario); 
        estadoUsuarios[_usuario] = Estado.Activo; 
    }

    function cambiarEstado(address _usuario, Estado _nuevoEstado) public {
        estadoUsuarios[_usuario] = _nuevoEstado; 
    }

    function obtenerEstado(address _usuario) public view returns (Estado) {
        return estadoUsuarios[_usuario];
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
