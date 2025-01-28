// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Tienda {

    // Definición de la struct Producto
    struct Producto {
        uint256 id;
        string nombre;
        uint256 precio;
        bool disponible;
    }

    // Contador para generar IDs únicos
    uint256 public contadorDeProductos;

    // Mapping de IDs a Productos
    mapping(uint256 => Producto) public productos;

    // Evento para registrar la adición de un nuevo producto
    event ProductoAgregado(uint256 id, string nombre, uint256 precio);

    // Función para agregar un nuevo producto
    function agregarProducto(string memory _nombre, uint256 _precio) public {
        contadorDeProductos++;
        productos[contadorDeProductos] = Producto(contadorDeProductos, _nombre, _precio, true);

        emit ProductoAgregado(contadorDeProductos, _nombre, _precio);
    }

    // Función para actualizar el precio de un producto
    function actualizarPrecio(uint256 _id, uint256 _nuevoPrecio) public {
        require(productos[_id].id != 0, "Producto no encontrado.");
        productos[_id].precio = _nuevoPrecio;
    }

    // Función para cambiar la disponibilidad de un producto
    function cambiarDisponibilidad(uint256 _id, bool _disponible) public {
        require(productos[_id].id != 0, "Producto no encontrado.");
        productos[_id].disponible = _disponible;
    }

    // Función para obtener los detalles de un producto
    function obtenerProducto(uint256 _id) public view returns (Producto memory) {
        require(productos[_id].id != 0, "Producto no encontrado.");
        return productos[_id];
    }
}
