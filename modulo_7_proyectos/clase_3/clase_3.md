# Clase 3: **Proyecto Práctico: Crea Tu Propio Token ERC-20**

## Introducción

¡Bienvenido a la Clase 3! Hoy aprenderemos a crear un token **ERC-20**, uno de los estándares más populares en la blockchain Ethereum, utilizado para crear tokens fungibles. Los tokens ERC-20 tienen una amplia gama de aplicaciones, desde criptomonedas hasta sistemas de puntos en juegos y recompensas. Veremos cómo construir, configurar e implementar un contrato ERC-20 utilizando **Hardhat** y **OpenZeppelin**.

### Temario:

1. Introducción al Estándar ERC-20  
2. Creando un Contrato ERC-20 con Hardhat y OpenZeppelin  
3. Paso a Paso para Desarrollar, Compilar e Implementar el Contrato  

---

## 1. Introducción al Estándar ERC-20

### ¿Qué es el Estándar ERC-20?

- **Definición**: ERC-20 es un estándar para crear tokens fungibles en Ethereum. Cada unidad del token es idéntica a las demás, similar a las monedas tradicionales.  
- **Funciones Básicas del ERC-20**:  
  - **`totalSupply`**: Devuelve la cantidad total de tokens.  
  - **`balanceOf`**: Devuelve el saldo de tokens de una dirección.  
  - **`transfer`**: Transfiere tokens de una dirección a otra.  
  - **`approve` y `transferFrom`**: Permiten que direcciones autorizadas gasten tokens en nombre de otros.  
  - **`allowance`**: Consulta el valor restante que una dirección puede gastar en nombre de otra.  
- **Casos de Uso**:  
  - Creación de criptomonedas.  
  - Sistemas de puntos de recompensa.  
  - Representación de activos y otros recursos fungibles.  

---

## 2. Creando un Contrato ERC-20 con Hardhat

Para este proyecto, utilizaremos **Hardhat** para configurar el entorno de desarrollo y la biblioteca **OpenZeppelin** para implementar el estándar ERC-20 de manera segura.

---

## 3. Paso a Paso del Proyecto

### Paso 1: Crear un Proyecto Hardhat

Inicializa un nuevo proyecto Hardhat:

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

---

### Paso 2: Instalar la Biblioteca OpenZeppelin

Instala la biblioteca **OpenZeppelin** para usar la implementación del estándar ERC-20:

```bash
npm install @openzeppelin/contracts
```

---

### Paso 3: Crear el Contrato `MiToken.sol`

Crea un archivo llamado `MiToken.sol` en la carpeta `contracts/` con el siguiente código:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MiToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MiToken", "MTK") {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }
}
```

- **Descripción del Contrato**:  
  - **ERC20**: Usamos la implementación estándar de OpenZeppelin para el ERC-20.  
  - **Constructor**: Recibe el suministro inicial de tokens y los acuña directamente para el creador del contrato.  
  - **Nombre y Símbolo**: Nombramos el token como "MiToken" y usamos "MTK" como su símbolo.  

---

### Paso 4: Compilar el Contrato

Compila el contrato para verificar que el código sea correcto:

```bash
npx hardhat compile
```

---

### Paso 5: Crear un Módulo en Ignition para el Deploy (`MiToken.js`)

Configura el despliegue usando Hardhat Ignition:

```javascript
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("MiToken", (m) => {
  const initialSupply = ethers.parseEther("1000000"); // Suministro inicial de 1.000.000 de tokens
  const miToken = m.contract("MiToken", [initialSupply]);

  return { miToken };
});
```

---

### Paso 6: Implementar en una Testnet (por ejemplo: Goerli)

Ejecuta el despliegue en un nodo local para pruebas o en una testnet:

1. Inicia un nodo local con Hardhat:

   ```bash
   npx hardhat node
   ```

2. Ejecuta el despliegue usando Hardhat Ignition:

   ```bash
   npx hardhat ignition deploy --network localhost
   ```

---

## Conclusión

Hoy construimos un contrato ERC-20 que permite crear y distribuir un token fungible. Exploramos el estándar ERC-20, las funciones esenciales y los pasos prácticos para desarrollar e implementar el contrato usando Hardhat y OpenZeppelin. Este proyecto práctico demuestra cómo crear tokens personalizados en la blockchain Ethereum.

---

## Resumen

1. **Estándar ERC-20**:  
   - Funciones esenciales y casos de uso para tokens fungibles.  
2. **Paso a Paso para Crear el Proyecto**:  
   - Configuración de Hardhat y uso de OpenZeppelin para implementar el estándar ERC-20.  
3. **Despliegue del Token**:  
   - Compilación y despliegue del contrato en un nodo local para pruebas.  

---

## Tarea

Implementa una función llamada `burn` en tu contrato ERC-20 que permita destruir tokens de forma permanente. Prueba esta funcionalidad en un entorno de desarrollo local.

---

## Próxima Clase

En la próxima clase, ¡crearemos un contrato de lotería!
