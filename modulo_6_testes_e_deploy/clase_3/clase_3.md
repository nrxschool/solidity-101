# Clase 3: **Proveedores RPC: Infura y Alchemy**

## Introducción

¡Bienvenido a la Clase 3! Hoy hablaremos sobre los **proveedores RPC** y cómo son fundamentales para conectar tus aplicaciones a la blockchain Ethereum de manera segura y eficiente. Aprenderemos cómo funcionan los proveedores RPC y exploraremos dos de los más populares: **Infura** y **Alchemy**.

### Temario:

1. ¿Qué es un Proveedor RPC?  
2. ¿Por qué usar un Proveedor RPC?  
3. Infura  
4. Alchemy  

---

## 1. ¿Qué es un Proveedor RPC?

### Visión General

- **RPC (Remote Procedure Call)** es un protocolo que permite que una aplicación envíe comandos y reciba respuestas de la blockchain Ethereum.
- **Proveedor RPC**: Proporciona un punto de acceso (endpoint) para la comunicación con la red Ethereum, gestionando las interacciones con un nodo Ethereum sin necesidad de que operes tu propio nodo.

---

## 2. ¿Por qué usar un Proveedor RPC?

### Ventajas de los Proveedores RPC

- **Simplicidad**: Elimina la necesidad de configurar y mantener un nodo propio, facilitando el desarrollo.  
- **Escalabilidad**: Los proveedores RPC ofrecen una infraestructura robusta para manejar un gran volumen de solicitudes.  
- **Confiabilidad**: La infraestructura de proveedores como Infura y Alchemy es altamente disponible y optimizada para un rendimiento eficiente.  
- **Seguridad**: Los proveedores implementan protocolos avanzados para proteger tus transacciones y datos.  

---

## 3. Infura

### Características de Infura

- **Popularidad**: Uno de los proveedores RPC más utilizados en la comunidad Ethereum.  
- **Facilidad de Integración**: Diseñado para funcionar fácilmente con bibliotecas como **ethers.js** y **web3.js**.  
- **Planes de Uso**:  
  - **Plan Gratuito**: Incluye una cantidad limitada de solicitudes por mes.  
  - **Planes de Pago**: Ofrecen soporte para un mayor volumen de solicitudes y funcionalidades adicionales.  

### Ejemplo de Conexión con Infura usando ethers.js

```javascript
const { ethers } = require("ethers");

// Conectando a la red Ethereum con Infura
const provider = new ethers.providers.JsonRpcProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID");

// A partir de aquí, puedes usar el provider para interactuar con la blockchain Ethereum
```

---

## 4. Alchemy

### Características de Alchemy

- **Enfoque en Desarrolladores**: Alchemy ofrece herramientas exclusivas y APIs avanzadas para simplificar el desarrollo de dApps.  
- **Características Adicionales**:  
  - **Monitoreo de Transacciones**: Permite rastrear y monitorear transacciones en tiempo real.  
  - **APIs para NFTs**: Herramientas avanzadas para integración con tokens no fungibles.  
  - **Webhooks y Alertas**: Notificaciones y alertas automatizadas para eventos en la blockchain.  
- **Planes de Uso**:  
  - **Plan Gratuito**: Incluye una cantidad limitada de solicitudes mensuales.  
  - **Planes de Pago**: Ofrecen características adicionales y soporte para un mayor volumen.  

### Ejemplo de Conexión con Alchemy usando ethers.js

```javascript
const { ethers } = require("ethers");

// Conectando a la red Ethereum con Alchemy
const provider = new ethers.providers.JsonRpcProvider("https://eth-mainnet.alchemyapi.io/v2/YOUR_ALCHEMY_API_KEY");

// A partir de aquí, puedes usar el provider para interactuar con la blockchain Ethereum
```

---

## Conclusión

En esta clase, exploramos los proveedores RPC, cómo simplifican el acceso a la blockchain Ethereum y garantizan una infraestructura de alta disponibilidad y seguridad. Conocimos Infura y Alchemy, dos proveedores populares que ofrecen herramientas y recursos para facilitar el desarrollo de dApps y otras soluciones basadas en blockchain.

---

## Resumen

1. **Proveedores RPC**: Son el puente entre tu aplicación y la blockchain, facilitando el desarrollo.  
2. **¿Por qué usar Proveedores RPC?**: Proveedores como Infura y Alchemy simplifican la conectividad con Ethereum sin la necesidad de gestionar tu propio nodo.  
3. **Infura y Alchemy**: Ambos ofrecen planes gratuitos, con opciones de pago para mayor volumen y características adicionales.  

---

## Tarea

Configura una cuenta gratuita en Infura y en Alchemy. Luego, intenta establecer una conexión con la red Ethereum usando cada proveedor y ejecuta una función simple, como `eth_blockNumber`, para verificar la comunicación.

---

## Próxima Clase

En la próxima clase, aprenderemos a integrar contratos con bibliotecas JavaScript para interacciones más avanzadas y automatización de tareas en la blockchain.