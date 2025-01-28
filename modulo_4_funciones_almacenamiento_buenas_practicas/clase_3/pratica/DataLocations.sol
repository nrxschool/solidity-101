// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract UbicacionesDeDatos {
    // Array dinámico de enteros sin signo. Almacenado en storage.
    uint256[] public numeros;
    // Mapping de IDs de usuarios a sus respectivas direcciones. Almacenado en storage.
    mapping(uint256 => address) public usuarioPorId;
    // Mapping de IDs de productos a sus respectivos datos (DatosDelProducto). Almacenado en storage.
    mapping(uint256 => DatosDelProducto) public datosDelProductoPorId;

    // Definición de una estructura llamada DatosDelProducto.
    struct DatosDelProducto {
        uint256 precio;
        string nombre;
    }

    // Función pública que demuestra diferentes ubicaciones de datos.
    function demostrarUbicacionesDeDatos() public {
        // Llama a la función interna _modificarDatosEnStorage, pasando variables de estado como argumentos.
        _modificarDatosEnStorage(numeros, usuarioPorId, datosDelProductoPorId[1]);

        // Accediendo a los datos de un producto dentro del mapping 'datosDelProductoPorId' en storage.
        // Usamos 'storage' para indicar que 'datosProducto' es una referencia a la struct almacenada en el mapping.
        DatosDelProducto storage datosProducto = datosDelProductoPorId[1];

        // Creando una nueva struct en memoria para representar datos de un producto temporal.
        // Usamos 'memory' para indicar que 'datosProductoTemporal' es una copia 
        // de la struct creada en memoria y no afecta el storage.
        DatosDelProducto memory datosProductoTemporal = DatosDelProducto(1, "Producto");

        // Modificando el precio del producto directamente en storage.
        datosProducto.precio = 1000; 

        // Modificando el nombre del producto en la variable de memoria.
        datosProductoTemporal.nombre = "Producto Ejemplo"; 

        // El cambio en 'datosProductoTemporal' no afecta a 'datosProducto' en storage.
    }

    // Función interna que recibe argumentos con sus ubicaciones de datos especificadas.
    function _modificarDatosEnStorage(
        uint256[] storage _numeros, // _numeros es una referencia a un array en storage.
        mapping(uint256 => address) storage _usuarioPorId, // _usuarioPorId es una referencia a un mapping en storage.
        DatosDelProducto storage _datosDelProducto // _datosDelProducto es una referencia a una struct en storage.
    ) internal {
        // Modificar _numeros, _usuarioPorId o _datosDelProducto dentro de esta función afectará directamente los datos en storage.
        // 1. Agregar un número al array `_numeros`
        _numeros.push(123);

        // 2. Agregar un usuario al mapping `_usuarioPorId`
        _usuarioPorId[1] = msg.sender;

        // 3. Modificar el precio del producto en la struct `_datosDelProducto`
        _datosDelProducto.precio = 500;
    }

    // Función que demuestra la devolución de una variable de memoria.
    function obtenerArrayDeNumeros(uint256[] memory _numeros) public pure returns (uint256[] memory) {
        // _numeros es un array asignado en memoria. 
        // Modificarlo aquí no afecta ninguna variable en storage.

        // Retorna un nuevo array asignado en memoria.
        return _numeros; 
    }

    // Función que demuestra el uso de calldata.
    // Calldata es una ubicación de datos especial, de solo lectura, 
    // para datos de entrada de función. Es más eficiente en términos de gas que memory.
    function procesarDatosDeEntrada(uint256[] calldata _datos) external pure returns(uint256) {
        // _datos es un array de solo lectura pasado como calldata.
        // No podemos modificar _datos dentro de esta función.
        uint256 suma = 0;
        for (uint256 i = 0; i < _datos.length; i++) {
            suma += _datos[i];
        }
        return suma;
    }
}
