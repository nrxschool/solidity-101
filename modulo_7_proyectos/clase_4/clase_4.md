# Clase 4: **Proyecto Práctico: Lotería Simple en Solidity**

## Introducción

¡Bienvenido a la Clase 4! En esta clase, desarrollaremos un contrato inteligente de **lotería**. Este proyecto práctico te ayudará a entender conceptos de **pagos, sorteos aleatorios simulados y control de flujo** en Solidity. Es un excelente ejemplo para consolidar conceptos fundamentales mientras construimos una aplicación descentralizada.

### Temario:

1. Estructura Básica de un Contrato de Lotería  
2. Implementación de las Funciones de Participación y Sorteo  
3. Paso a Paso para Compilar e Implementar el Contrato  

---

## 1. Estructura Básica de un Contrato de Lotería

### Concepto

Una lotería simple funciona de la siguiente manera:  
- **Participantes** compran boletos enviando una cantidad fija de Ether al contrato.  
- **Sorteo**: Una función especial selecciona aleatoriamente un ganador entre los participantes.  
- **Distribución del Premio**: El ganador recibe el valor total acumulado en el contrato.  

### Variables y Funciones Necesarias

- **Variables de Estado**:  
  - `dueño`: Dirección del propietario del contrato que administra el sorteo.  
  - `participantes`: Array que almacena las direcciones de todos los participantes.  

- **Funciones Principales**:  
  - `participar`: Permite a un usuario comprar un boleto enviando Ether.  
  - `sortearGanador`: Realiza el sorteo y transfiere el premio al ganador (restringido al dueño).  
  - `getParticipantes`: Devuelve la lista de participantes.  

---

## 2. Implementación del Contrato de Lotería

### Código del Contrato `LoteriaSimple.sol`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract LoteriaSimple {
    address public dueño;
    address[] public participantes;

    constructor() {
        dueño = msg.sender;
    }

    // Función para participar en la lotería
    function participar() public payable {
        require(msg.value == 0.01 ether, "El valor de participacion es de 0.01 Ether.");
        participantes.push(msg.sender);
    }

    // Función para realizar el sorteo y transferir el premio
    function sortearGanador() public soloDueño {
        require(participantes.length > 0, "No hay participantes.");
        uint indiceGanador = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, participantes))) % participantes.length;
        address ganador = participantes[indiceGanador];

        // Transferir el valor total del contrato al ganador
        payable(ganador).transfer(address(this).balance);

        // Reiniciar la lista de participantes
        delete participantes;
    }

    // Modificador para restringir la función al dueño
    modifier soloDueño() {
        require(msg.sender == dueño, "Solo el dueño puede llamar esta funcion.");
        _;
    }

    // Función para devolver el número de participantes
    function getParticipantes() public view returns (uint) {
        return participantes.length;
    }
}
```

- **Descripción del Contrato**:  
  - **participar**: Recibe exactamente 0.01 Ether y registra al participante.  
  - **sortearGanador**: Genera un índice pseudoaleatorio, selecciona un ganador y transfiere el saldo del contrato.  
  - **Modificador soloDueño**: Restringe la función `sortearGanador` al propietario del contrato.  
  - **getParticipantes**: Devuelve la cantidad de participantes actuales.  

---

## 3. Paso a Paso del Proyecto

### Paso 1: Crear el Proyecto con Hardhat

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

### Paso 2: Agregar el Contrato `LoteriaSimple.sol`

En la carpeta `contracts/`, agrega el contrato `LoteriaSimple.sol` con el código anterior.

---

### Paso 3: Compilar el Contrato

Compila el contrato para verificar la existencia de errores:

```bash
npx hardhat compile
```

---

### Paso 4: Crear un Script de Deploy para el Contrato

Crea un archivo de despliegue llamado `deployLoteria.js` en `scripts/`:

```javascript
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("LoteriaSimple", (m) => {
  const loteriaSimple = m.contract("LoteriaSimple");

  return { loteriaSimple };
});
```

---

### Paso 5: Implementar el Contrato en un Nodo Local

1. Inicia un nodo local con Hardhat:

   ```bash
   npx hardhat node
   ```

2. Ejecuta el despliegue del contrato:

   ```bash
   npx hardhat ignition deploy --network localhost
   ```

---

## Conclusión

Hoy construimos una **lotería simple en Solidity**, cubriendo los principales conceptos de **pagos, sorteos y control de acceso**. Este ejemplo práctico demostró cómo organizar funciones y variables para crear una aplicación funcional y entretenida.

---

## Resumen

1. **Estructura del Contrato**:  
   - Funciones para participación y sorteo, además del uso de modificadores de acceso.  
2. **Paso a Paso para Crear el Proyecto**:  
   - Desarrollo y despliegue del contrato utilizando Hardhat.  
3. **Próximos Pasos**:  
   - Implementar mejoras, como restricciones de tiempo o incremento del premio según la cantidad de participantes.  

---

## Tarea

Añade una función que permita al dueño configurar la cantidad de Ether necesaria para participar en la lotería y verifica esta configuración en la función `participar`.
