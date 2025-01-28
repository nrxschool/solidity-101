// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract GestionPersonas {
    struct Persona {
        string nombre;
        uint256 edad;
        bool activo;
    }

    // Creando una variable de estado del tipo 'Persona'
    Persona public persona;

    // Función para crear una nueva persona
    function crearPersona(string memory _nombre, uint256 _edad) public returns (Persona memory) {
        persona = Persona(_nombre, _edad, true);
        return persona;
    }

    // Función para demostrar Value Type
    function demostrarValueType(uint256 _numero) public pure returns (uint256, uint256) {
        uint256 numeroLocal = _numero; // _numero se copia a numeroLocal
        numeroLocal += 10; // Modifica solo numeroLocal
        return (numeroLocal, _numero); 
    }

    // Función para demostrar Reference Type
    function demostrarReferenceType(Persona memory _persona) public pure returns (Persona memory) {
        Persona memory _persona2 = _persona;
        _persona2.edad += 1;
        return _persona; 
    }
}
