## Clase 2: Creando tu Primer Proyecto con Hardhat

**Objetivo:** Aprender a crear un proyecto con Hardhat, entender su estructura y los módulos principales que lo componen: Hardhat Network, Hardhat Ignition y Hardhat Runner.

**Contenido:**

### 1. Creando un Proyecto con Hardhat:

- **Inicializar un nuevo proyecto Node.js:** `npm init -y`
- **Instalar Hardhat:** `npm install --save-dev hardhat`
- **Crear un proyecto Hardhat:** `npx hardhat init`
- **Seleccionar la opción:** "Create an empty hardhat.config.js"

### 2. Entendiendo la Estructura del Proyecto:

Después de crear el proyecto, tendrás la siguiente estructura:

```
tu-proyecto//
├── contracts/
│   └── ... tus contratos Solidity
├── ignition/
│   └── ... tus módulos 
└── hardhat.config.js
```

- **`contracts/`**: carpeta para almacenar tus contratos Solidity.
- **`ignition/`**: carpeta que contiene los archivos de despliegue, llamados "módulos". Estos módulos configuran cómo se implementarán tus contratos inteligentes en diferentes redes, especificando parámetros, dependencias y scripts personalizados para el proceso de despliegue.
- **`hardhat.config.js`**: archivo de configuración de Hardhat.

---

**Módulos Principales de Hardhat:**

- **Hardhat Network:**
    - Una red local de Ethereum para desarrollo y pruebas.
    - Permite ejecutar tus contratos en un entorno aislado y controlable.
    - Facilita la depuración y la ejecución de pruebas.
- **Hardhat Ignition:**
    - Herramienta para implementar tus contratos en diferentes redes.
    - Simplifica el proceso de despliegue y ofrece opciones avanzadas de configuración.
    - Compatible con diversas redes, como mainnet, testnets y redes privadas.
- **Hardhat Runner:**
    - La interfaz de línea de comandos de Hardhat.
    - Permite ejecutar tareas como compilar contratos, realizar pruebas y desplegar contratos.
    - Ofrece comandos para interactuar con tus contratos y la blockchain.
