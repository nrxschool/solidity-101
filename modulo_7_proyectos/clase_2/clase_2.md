# Clase 2: **Proyecto Práctico: Crea Tus Propios NFTs (ERC-721)**

## Introducción

¡Bienvenido a la Clase 2! Hoy pondremos en práctica lo que aprendimos sobre el estándar **ERC-721** y crearemos un **NFT** (Non-Fungible Token) utilizando **Hardhat** y **OpenZeppelin**. Los NFTs son únicos y no fungibles, lo que significa que cada token tiene su propia identidad. En esta clase, exploraremos los conceptos y los pasos prácticos para crear tu propio contrato NFT.

### Temario:

1. Introducción a los NFTs y al estándar ERC-721  
2. Creando un contrato ERC-721 con Hardhat y OpenZeppelin  
3. Paso a Paso para Desarrollar, Compilar e Implementar el Contrato  

---

## 1. Introducción a los NFTs (ERC-721)

### Revisión del Concepto de NFTs

- **Definición**: Los NFTs son tokens únicos e intransferibles en la blockchain, que representan elementos como arte digital, coleccionables y activos de videojuegos.  
- **Estándar ERC-721**:  
  - Define un conjunto de funciones para crear, transferir y gestionar NFTs.  
  - **Casos de Uso**: Arte digital, coleccionables, terrenos y activos en videojuegos, elementos del metaverso, entre otros.  

---

## 2. Creando un Contrato ERC-721 con Hardhat

Para este proyecto, utilizaremos **Hardhat** para configurar y desarrollar el contrato, y la **biblioteca OpenZeppelin** para facilitar la creación del estándar ERC-721 con funcionalidades seguras.

---

## 3. Paso a Paso del Proyecto

### Paso 1: Crear un Proyecto Hardhat

Primero, crea un nuevo proyecto Hardhat e inicialízalo:

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

---

### Paso 2: Instalar la Biblioteca OpenZeppelin

Instalamos el paquete OpenZeppelin para acceder a la implementación del estándar ERC-721:

```bash
npm install @openzeppelin/contracts
```

---

### Paso 3: Crear el Contrato `MiNFT.sol`

Crea un archivo llamado `MiNFT.sol` en la carpeta `contracts/` con el siguiente código:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MiNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MiNFT", "MNFT") {}

    function mint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
```

- **Descripción del Contrato**:  
  - **`ERC721`**: La clase base para nuestro NFT, proporcionada por OpenZeppelin.  
  - **Counters**: Gestiona IDs únicos para cada NFT creado.  
  - **`mint`**: Función pública para acuñar nuevos NFTs y asociarlos a la dirección especificada.  

---

### Paso 4: Compilar el Contrato

Compila el contrato para verificar si el código es correcto y está listo para ser implementado:

```bash
npx hardhat compile
```

---

### Paso 5: Crear un Módulo en Ignition para el Deploy (`MiNFT.js`)

Configura el script de deploy utilizando Hardhat Ignition:

```javascript
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("MiNFT", (m) => {
  const miNFT = m.contract("MiNFT");

  return { miNFT };
});
```

---

### Paso 6: Implementar en una Testnet (por ejemplo: Goerli)

Ejecuta el deploy en un nodo local para pruebas. Si lo deseas, utiliza una red de prueba como Goerli:

1. Inicia un nodo local con Hardhat:

   ```bash
   npx hardhat node
   ```

2. Ejecuta el deploy usando Hardhat Ignition:

   ```bash
   npx hardhat ignition deploy --network localhost
   ```

---

## Conclusión

En esta clase, construimos un contrato ERC-721 para crear y gestionar NFTs. Exploramos el concepto de NFTs, los pasos para configurar el proyecto con Hardhat, la utilización de OpenZeppelin para implementar el estándar ERC-721 y las etapas de compilación e implementación. Este proyecto práctico demuestra el poder y la flexibilidad de los contratos inteligentes y cómo los NFTs pueden ser creados y gestionados en la blockchain Ethereum.

---

## Resumen

1. **Introducción a los NFTs y ERC-721**:  
   - Revisión del concepto de NFTs y su uso en el mundo blockchain.  
2. **Paso a Paso para Crear un Proyecto ERC-721**:  
   - Configuración de Hardhat, uso de OpenZeppelin y desarrollo del contrato `MiNFT`.  
3. **Deploy**:  
   - Compilación e implementación del contrato en un nodo local para pruebas.  

---

## Tarea

¡Acuña tu primer NFT en una testnet! Modifica el contrato para incluir un nombre único y una descripción para cada NFT acuñado, registrando estos datos en la blockchain.

---

## Próxima Clase

En la próxima clase, exploraremos el estándar ERC-20 y cómo permite crear tokens fungibles.
