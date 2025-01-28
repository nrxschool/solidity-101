# Clase 3: Almacenamiento de Datos: Memory, Calldata y Storage

## Introducción

¡Bienvenido a la Clase 3! Hoy exploraremos los diferentes tipos de almacenamiento de datos en Solidity: **memory**, **calldata** y **storage**. Comprender dónde y cómo almacenar datos es esencial para optimizar el rendimiento y la eficiencia de los contratos inteligentes.

### Agenda:

1. ¿Dónde Residen tus Datos?  
2. Storage  
3. Memory  
4. Calldata  

---

## 1. ¿Dónde Residen tus Datos?

Solidity ofrece tres ubicaciones para almacenar datos:

- **Storage:** Almacenamiento persistente en la blockchain.  
  > Es la ubicación predeterminada para **variables de estado** (variables declaradas **fuera de las funciones y dentro del alcance del contrato**). El almacenamiento es persistente y **costoso en términos de consumo de gas** para **modificar o interactuar con él**. Las variables de almacenamiento se guardan en el estado del contrato y persisten entre llamadas a funciones y transacciones. Estas se almacenan en el espacio de almacenamiento de la blockchain asociado a una dirección de contrato. Cada nodo tiene una copia de todo lo almacenado en el storage.

- **Memory:** Almacenamiento temporal en memoria.  
  > Es un área de almacenamiento temporal y más económica que **`storage`**. Las variables en memoria se guardan solo durante la ejecución de una función y se eliminan después de que la función regresa. Se utiliza para variables locales de funciones que no son de estado y se almacenan en memoria de forma predeterminada. Puedes **especificar explícitamente la ubicación de los datos como `memory` para parámetros y variables de retorno de funciones.**

- **Calldata:** Espacio de memoria temporal y no modificable para parámetros de funciones externas.  
  > Es un área de almacenamiento **inmutable** y específica para los **datos de entrada (argumentos) de una función llamada externamente al contrato**. El calldata se usa cuando una función es llamada externamente al contrato, como cuando un usuario interactúa con él mediante una transacción. Los datos en calldata se escriben en la blockchain como parte de la transacción, pero no se almacenan permanentemente en el contrato. Es más barato en términos de gas que **`memory`**, ya que solo permite lectura y no modificaciones.

### Impacto en el Contrato

La elección del lugar de almacenamiento afecta:  
- El costo de gas.  
- La visibilidad de los datos.  
- La persistencia de los datos.  

---

## 2. Storage

- Ubicación de almacenamiento **permanente** en la blockchain.  
- Usada para variables de estado del contrato.  
- **Alto costo de escritura**, pero lectura más económica.  
- Los datos persisten entre llamadas a funciones.  

### Ejemplo:

```solidity
contract MiContrato {
    uint public miNumero; // Almacenado en storage
}
```

---

## 3. Memory

- Ubicación de almacenamiento **temporal** en memoria.  
- Usada para variables locales dentro de funciones.  
- **Más económico que storage**, tanto para lectura como para escritura.  
- Los datos se eliminan después de la ejecución de la función.  

### Ejemplo:

```solidity
function miFuncion(uint _numero) public pure returns (uint) {
    uint nuevoNumero = _numero * 2; // Almacenado en memory
    return nuevoNumero;
}
```

---

## 4. Calldata

- Ubicación de almacenamiento **temporal** e **inmutable**.  
- Usada para parámetros de funciones externas.  
- Similar a memory en términos de costo.  
- Evita modificaciones accidentales de los datos de entrada.  

### Ejemplo:

```solidity
function miFuncion(uint[] calldata _numeros) public pure returns (uint) {
    // ...
}
```

---

## Conclusión

En esta clase, exploramos las diferentes ubicaciones de almacenamiento en Solidity: **storage**, **memory** y **calldata**. Cada una tiene características e impactos diferentes en términos de persistencia y costo de gas. Elegir correctamente el tipo de almacenamiento para cada dato ayuda a optimizar el contrato en términos de rendimiento y costo.

---

## Resumen

1. **¿Dónde Residen tus Datos?** - Opciones de almacenamiento en Solidity.  
2. **Storage** - Almacenamiento permanente y costoso para variables de estado.  
3. **Memory** - Almacenamiento temporal y económico dentro de funciones.  
4. **Calldata** - Almacenamiento temporal e inmutable para parámetros de funciones externas.  

---

## Tarea

- Explora y experimenta usando `memory` y `calldata` en diferentes tipos de funciones para comprender cómo impactan el costo de gas.  
- Prueba modificar variables en storage y memory para observar las diferencias de persistencia entre llamadas a funciones.  

---

## Próxima Clase

En la próxima clase, aprenderemos a escribir **código seguro en Solidity**. ¡Nos vemos allí!
