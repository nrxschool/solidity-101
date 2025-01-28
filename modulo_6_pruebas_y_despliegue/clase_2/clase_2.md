# Clase 2: **Ecosistema Ethereum: ethers.js y web3.js**

## Introducción

¡Bienvenido a la clase 2! Hoy exploraremos el **ecosistema Ethereum** y aprenderemos a usar las bibliotecas JavaScript **ethers.js** y **web3.js** para interactuar con la blockchain. Estas herramientas son esenciales para cualquier desarrollador de Ethereum, ya que facilitan la comunicación con contratos inteligentes y la realización de transacciones en la red.

### Temario

1. El Ecosistema Ethereum  
2. Interacción con la Blockchain usando ethers.js y web3.js

---

## 1. El Ecosistema Ethereum

### Visión General

El ecosistema Ethereum está compuesto por diversas herramientas, bibliotecas, estándares y aplicaciones, que ofrecen una estructura para el desarrollo de contratos inteligentes y dApps. Vamos a explorar los componentes principales que hacen que el desarrollo en Ethereum sea un proceso más integrado y eficiente.

### Componentes Principales

- **Clientes Ethereum**: Software como **Geth** y **Besu**, que permiten la conexión a la red Ethereum y el procesamiento de transacciones.
- **Carteras**: Herramientas como **MetaMask** y **Ledger**, que gestionan claves privadas e interactúan con contratos.
- **Exploradores de Bloques**: Plataformas como **Etherscan**, que permiten visualizar detalles de transacciones, bloques y cuentas.
- **Bibliotecas**: Herramientas como **ethers.js** y **web3.js**, que permiten a los desarrolladores interactuar con la blockchain utilizando JavaScript.
- **Estándares**: Estándares como **ERC-20** y **ERC-721**, que garantizan que diferentes contratos sigan convenciones específicas, permitiendo la interoperabilidad.
- **Aplicaciones**: **dApps**, **DeFi**, **NFTs**, **DAOs**, y otras aplicaciones que utilizan contratos inteligentes para ofrecer servicios descentralizados.

---

## 2. Interacción con la Blockchain

### ethers.js y web3.js

Estas bibliotecas JavaScript son las herramientas principales para conectarse a la blockchain e interactuar con contratos. Veamos el rol de cada una:

- **ethers.js**: Una biblioteca ligera y flexible, popular por su integración con wallets como MetaMask y facilidad de uso en dApps.
- **web3.js**: Ampliamente utilizada para interactuar con contratos Ethereum y realizar transacciones.

### Principales Funcionalidades

Ambas bibliotecas permiten realizar acciones como:

- **Conectar a diferentes redes**: Mainnet, Testnets o redes locales.
- **Firmar y enviar transacciones**: Realizar transferencias de Ether o llamadas a contratos inteligentes.
- **Interactuar con contratos**: Llamar funciones de contratos y obtener datos.
- **Escuchar eventos**: Recibir notificaciones sobre transacciones y otras actividades específicas.

---

## Ejemplo Práctico con ethers.js

### Configuración del Entorno

1. **Configurar el proveedor**: Crea una conexión con la red Ethereum (usando un servicio como Infura o Alchemy).
2. **Instanciar el contrato**: Usa la dirección del contrato y la ABI para crear una instancia del contrato.
3. **Llamar una función**: Realiza una llamada de lectura o escritura en un contrato.

### Ejemplo de Código

```javascript
// Importando la biblioteca ethers.js
const { ethers } = require("ethers");

// Configurando el proveedor (utiliza un endpoint de mainnet/testnet, como Infura o Alchemy)
const provider = new ethers.providers.JsonRpcProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID");

// Configurando la ABI y la dirección del contrato
const direccionContrato = "0x1234567890abcdef1234567890abcdef12345678";
const abiContrato = [
    // ABI del contrato (array con funciones y eventos)
    "function miFuncion() public view returns (string)"
];

// Creando una instancia del contrato
const contrato = new ethers.Contract(direccionContrato, abiContrato, provider);

async function main() {
    try {
        // Llamando a una función del contrato
        const resultado = await contrato.miFuncion();
        console.log("Resultado:", resultado);
    } catch (error) {
        console.error("Error al llamar a la función:", error);
    }
}

main();
```

- **Descripción**:
  - **Proveedor**: Conéctate a una red (usando una API JSON-RPC).
  - **Contrato**: Usa la dirección del contrato y la ABI para configurar el acceso.
  - **Función**: Llama `miFuncion()` para obtener datos del contrato.

### Notas

- **Seguridad**: Nunca compartas tu clave privada. Para operaciones de transacción, utiliza una wallet segura.
- **Costo del Gas**: Verifica siempre el costo de gas al interactuar con funciones complejas o al enviar transacciones en mainnet.

---

## Conclusión

En esta clase, exploramos el **ecosistema Ethereum** y las principales herramientas de desarrollo, como **ethers.js** y **web3.js**. Estas bibliotecas facilitan la interacción con contratos inteligentes, permitiendo que los desarrolladores integren sus aplicaciones con la blockchain Ethereum de manera eficiente y segura.

---

## Resumen

1. **Ecosistema Ethereum**:
   - Compuesto por clientes, wallets, exploradores, estándares y dApps.
2. **ethers.js y web3.js**:
   - Herramientas esenciales para conexión e interacción con la blockchain.
3. **Ejemplo Práctico**:
   - Creamos un ejemplo con ethers.js, donde configuramos un proveedor, instanciamos un contrato y llamamos una función.

---

## Tarea

1. Configura una cuenta en Infura o Alchemy para obtener una API Key.
2. Implementa un código para llamar a una función de un contrato de token ERC-20 (como `balanceOf`) usando ethers.js y muestra el saldo de una cuenta.

---

## Próxima Clase

En la próxima clase, aprenderemos sobre **eventos y cómo escuchar y reaccionar a ellos en contratos inteligentes**.