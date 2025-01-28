// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ControlDeAcceso {
    // bytes32 public constant EJEMPLO_ROLE = keccak256("EJEMPLO_ROLE");
    enum Role { NINGUNO, ADMIN, USUARIO }

    // Mapping para almacenar el rol de cada dirección
    mapping(address => Role) public roles;

    // Lista blanca de direcciones permitidas
    mapping(address => bool) public whitelist;

    // Constructor para definir al creador del contrato como ADMIN
    constructor() {
        roles[msg.sender] = Role.ADMIN;
    }

    modifier soloAdmin() {
        require(roles[msg.sender] == Role.ADMIN, "Acceso restringido a ADMINs.");
        _;
    }

    modifier soloUsuario() {
        require(roles[msg.sender] == Role.USUARIO, unicode"Acceso restringido a usuarios.");
        _;
    }

    modifier soloWhitelist() {
        require(whitelist[msg.sender], unicode"Acceso restringido a la whitelist.");
        _;
    }

    function agregarAWhitelist(address _direccion) public soloAdmin {
        whitelist[_direccion] = true;
    }

    function removerDeWhitelist(address _direccion) public soloAdmin {
        whitelist[_direccion] = false;
    }

    // Función para que el ADMIN otorgue el rol de USUARIO a una dirección
    function otorgarRolUsuario(address _direccion) public soloAdmin {
        require(roles[_direccion] == Role.NINGUNO, unicode"Esta dirección ya tiene un rol.");
        roles[_direccion] = Role.USUARIO;
    }

    // Función para que el ADMIN revoque el rol de una dirección
    function revocarRol(address _direccion) public soloAdmin {
        require(roles[_direccion] != Role.NINGUNO, unicode"Esta dirección no tiene un rol.");
        roles[_direccion] = Role.NINGUNO;
    }

    function funcionDeWhitelist() public soloWhitelist view returns (string memory) {
        return "Whitelist llamo";
    }

    function funcionDeUsuario() public soloUsuario view returns (string memory) {
        return "Usuario llamo";
    }
}
