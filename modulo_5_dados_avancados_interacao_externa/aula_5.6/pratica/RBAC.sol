// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ControleDeAcesso {
    enum Role { NENHUM, ADMIN, USUARIO }

    // Mapping para armazenar o role de cada endereço
    mapping(address => Role) public roles;

    // Whitelist de endereços permitidos
    mapping(address => bool) public whitelist;


    // Construtor para definir o criador do contrato como ADMIN
    constructor() {
        roles[msg.sender] = Role.ADMIN;
    }

    modifier apenasAdmin() {
        require(roles[msg.sender] == Role.ADMIN, "Acesso restrito a ADMINs.");
        _;
    }

    modifier apenasWhitelist() {
        require(whitelist[msg.sender], unicode"Acesso restrito à whitelist.");
        _;
    }

    function adicionarNaWhitelist(address _endereco) public apenasAdmin {
        whitelist[_endereco] = true;
    }

    function removerDaWhitelist(address _endereco) public apenasAdmin {
        whitelist[_endereco] = false;
    }

    // Função para o ADMIN conceder o role de USUARIO a um endereço
    function concederRoleUsuario(address _endereco) public apenasAdmin {
        require(roles[_endereco] == Role.NENHUM, unicode"Este endereço já possui um role.");
        roles[_endereco] = Role.USUARIO;
    }

    // Função para o ADMIN revogar o role de um endereço
    function revogarRole(address _endereco) public apenasAdmin {
        require(roles[_endereco] != Role.NENHUM, unicode"Este endereço não possui um role.");
        roles[_endereco] = Role.NENHUM;
    }

    function funcaoDaWhitelist() public apenasWhitelist view returns (string memory) {
        return "Whitelist chamou";
    }

    function funcaoDeUsuario() public view returns (string memory) {
        require(roles[msg.sender] == Role.USUARIO, unicode"Acesso restrito a usuários.");
        return "Usuario chamou";
    }
}