# Clase 5: **Anatomía de un Contrato en Solidity**

## Introducción

¡Hola! Bienvenido a la quinta clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos los tipos de datos en Solidity y cómo utilizarlos en tus contratos inteligentes. Hoy, vamos a entender la estructura básica de un contrato en Solidity, incluyendo la definición de licencias, pragmas, imports, comentarios, variables de estado y el constructor. Comprender la anatomía de un contrato es fundamental para escribir códigos claros, organizados y compatibles con las mejores prácticas de la comunidad.

### Agenda:

1. Identificador de Licencia SPDX  
2. Pragmas  
3. Imports  
4. Comentarios: Documentación en el Código  
5. Definición del Contrato y Variables de Estado  
6. Constructor  

---

## 1. Identificador de Licencia SPDX

El **Identificador de Licencia SPDX** es un estándar que especifica la licencia bajo la cual se publica el contrato. Añadir el SPDX ayuda a aclarar el tipo de licencia, facilitando la revisión, el cumplimiento y la reutilización por otros desarrolladores.

```solidity
// SPDX-License-Identifier: MIT
```

- **¿Por qué usarlo?**: Especificar la licencia promueve la transparencia y evita ambigüedades legales sobre el uso y modificación del código.
- **Identificadores de Licencia Comunes**:
  - **MIT**: Permisiva, permite uso, copia, modificación y distribución.
  - **GPL-3.0**: Requiere que las modificaciones también sean distribuidas bajo la misma licencia.
  - **Apache-2.0**: Permisiva, incluye cláusulas de patente.

**Ejemplo:**

```solidity
// SPDX-License-Identifier: GPL-3.0
```

---

## 2. Pragmas

El **pragma** indica la versión del compilador Solidity necesaria para compilar el contrato, ayudando a garantizar que el código se ejecute correctamente en versiones soportadas. Esto previene incompatibilidades y comportamientos inesperados.

```solidity
pragma solidity ^0.8.0;
```

- **Especificando Versiones**:
  - **Número de Versión Específico**:
    - `pragma solidity 0.8.17;`
    - Indica que el contrato debe ser compilado exactamente con la versión 0.8.17.
  - **Rango de Versiones**:
    - `pragma solidity ^0.8.0;`
      - El operador `^` permite cualquier versión mayor o igual a 0.8.0 y menor que 0.9.0.
      - **Recomendado**, ya que permite aprovechar mejoras y correcciones dentro de la misma serie principal.
    - `pragma solidity >=0.7.0;`
      - Permite cualquier versión mayor o igual a 0.7.0.
      - **Menos restrictivo**, pero puede llevar a problemas de compatibilidad.

**Nota:** Siempre utiliza el pragma adecuado para garantizar la seguridad y funcionalidad de tu contrato.

---

## 3. Imports

El **import** permite la inclusión de otros contratos y bibliotecas en tu código Solidity, promoviendo la modularidad y reutilización. Esto facilita la organización del código y el uso de contratos estándar y seguros.

```solidity
import "@openzeppelin/contracts/access/Ownable.sol";
```

- **¿Por qué usarlo?**: Reutilizar código bien probado y auditado reduce errores y vulnerabilidades.
- **Ejemplo de Bibliotecas Comunes**:
  - **OpenZeppelin**: Conjunto de contratos estándar ampliamente utilizado para la implementación de estándares como ERC20, ERC721, control de acceso, entre otros.

**Cómo usarlo:**

```solidity
// Importando el contrato Ownable para control de propiedad
import "@openzeppelin/contracts/access/Ownable.sol";

contract MiContrato is Ownable {
    // Código del contrato aquí
}
```

---

## 4. Comentarios: Documentación en el Código

Los comentarios son esenciales para hacer que el código sea más legible y comprensible, tanto para ti como para otros desarrolladores. Ayudan a explicar qué hace el código, por qué se tomaron ciertas decisiones y cómo utilizar funciones y variables.

### Tipos de Comentarios

- **Comentarios de Línea Única**:

  ```solidity
  // Este es un comentario de línea única
  ```

- **Comentarios de Bloque**:

  ```solidity
  /*
     Este es un comentario de bloque.
     Puede abarcar múltiples líneas.
  */
  ```

- **Comentarios de NatSpec (Ethereum Natural Language Specification Format)**:

  Utilizados para documentar contratos, funciones y variables siguiendo un estándar que puede ser usado por herramientas de documentación e interfaces gráficas.

  ```solidity
  /// @title Título del Contrato
  /// @author Autor
  /// @notice Breve explicación sobre el contrato o función
  /// @dev Detalles técnicos o notas de desarrollo

  /// @param _usuario La dirección del usuario
  /// @return saldo El saldo actual del usuario
  ```

**Ejemplo:**

```solidity
/// @title Contrato de Ejemplo
/// @author Alice
/// @notice Este contrato demuestra el uso de comentarios en Solidity
contract EjemploContrato {
    /// @notice Almacena la dirección del propietario
    address public owner;

    /// @notice Constructor que define al propietario inicial
    constructor() {
        owner = msg.sender; // Define al propietario del contrato como quien lo despliega
    }

    /// @notice Función que retorna la dirección del propietario
    /// @return La dirección del propietario actual
    function getOwner() public view returns (address) {
        return owner;
    }
}
```

---

## 5. Definición del Contrato y Variables de Estado

La **definición del contrato** es donde declaramos el nombre del contrato e iniciamos su implementación. Las **variables de estado** se declaran dentro del contrato y representan datos almacenados permanentemente en la blockchain.

```solidity
contract EjemploContrato {
    
    // Variables de estado
    address public owner;    // Dirección del propietario del contrato
    uint256 public balance;  // Saldo total del contrato

    // Resto del código del contrato
}
```

- **Variables de Estado**:
  - **Almacenamiento Permanente**: Persisten entre transacciones y llamadas a funciones.
  - **Visibilidad**: Pueden ser públicas, privadas, internas o externas.
  - **Tipos Comunes**: `uint`, `address`, `string`, `bool`, entre otros.

**Ejemplo de Uso:**

```solidity
contract Banco {
    mapping(address => uint256) public saldos;

    // Funciones para manipular los saldos
}
```

---

## 6. Constructor

El **constructor** es una función especial que se ejecuta una sola vez, en el momento del despliegue del contrato. Se usa para inicializar variables de estado y definir las condiciones iniciales del contrato.

```solidity
constructor() {
    owner = msg.sender; // Define al propietario del contrato como quien lo creó
    balance = 0;        // Inicializa el saldo con cero
}
```

- **Características del Constructor**:
  - **Ejecutado una sola vez**: En el momento del despliegue.
  - **Inicialización**: Define valores iniciales para variables de estado.
  - **Parámetros**: Puede aceptar argumentos para configurar el contrato al desplegarlo.

**Ejemplo con Parámetros:**

```solidity
contract Token {
    string public nombre;
    string public simbolo;
    uint8 public decimales;
    uint256 public totalSupply;

    constructor(string memory _nombre, string memory _simbolo, uint8 _decimales, uint256 _totalSupply) {
        nombre = _nombre;
        simbolo = _simbolo;
        decimales = _decimales;
        totalSupply = _totalSupply;
    }
}
```

---

## Conclusión

En esta clase, exploramos la anatomía básica de un contrato en Solidity. Comprendimos la importancia de especificar la licencia con el Identificador SPDX, definir la versión del compilador con el pragma, organizar el código usando imports y mantener una documentación clara mediante comentarios. También vimos cómo declarar el contrato, definir variables de estado e inicializarlo usando el constructor. Estos componentes forman la base para escribir contratos inteligentes bien estructurados y adherentes a las mejores prácticas de la comunidad.

---

## Resumen

1. **Identificador de Licencia SPDX**: Especifica la licencia del contrato, promoviendo cumplimiento legal y reutilización segura.  
2. **Pragmas**: Indican la versión del compilador Solidity necesaria, garantizando compatibilidad y seguridad.  
3. **Imports**: Permiten incluir contratos y bibliotecas externas, facilitando la modularidad y reutilización de código.  
4. **Comentarios**: Mejoran la legibilidad y comprensión del código, siendo esenciales para la documentación.  
5. **Definición del Contrato y Variables de Estado**: Estructura básica del contrato y almacenamiento de datos persistentes en la blockchain.  
6. **Constructor**: Función especial para inicializar el contrato durante el despliegue.  

---

## Tarea

Crea un contrato simple llamado `MiContrato` que incluya el Identificador SPDX, el pragma con la versión 0.8.0 y un comentario que describa el contrato.

---

## Próxima clase

En la próxima clase, exploraremos las variables globales de Solidity.
