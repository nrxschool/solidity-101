# Clase 2: **Eventos: Notificando al Mundo Exterior**

## Introducción

¡Hola! Bienvenido a la Clase 2 de nuestro curso de Solidity para principiantes. En la clase anterior, exploramos las funciones en Solidity, aprendiendo cómo declararlas, utilizarlas y la importancia de los modificadores de visibilidad. Hoy profundizaremos en una característica poderosa de Solidity: los **eventos**.

Los eventos son fundamentales para la comunicación entre contratos inteligentes y el mundo exterior. Permiten que los contratos inteligentes emitan información que puede ser capturada por aplicaciones externas, como interfaces de usuario u otros sistemas. En esta clase, aprenderemos qué son los eventos, cómo declararlos, cómo emitirlos y cómo las aplicaciones externas pueden escucharlos.

### Agenda:

1. ¿Qué son los Eventos en Solidity?  
2. Declarando Eventos  
3. Emisión de Eventos  
4. Escuchando Eventos Externamente  
5. Buenas Prácticas con Eventos  

---

## 1. ¿Qué son los Eventos en Solidity?

### Definición

- **Eventos** son mecanismos en Solidity que permiten que un contrato inteligente **registre información** en la blockchain.  
- Se almacenan en los **logs** de la transacción, que son una estructura de datos especial en la blockchain de Ethereum.  
- Estos logs no son accesibles por los contratos inteligentes, pero pueden ser escuchados por **aplicaciones externas**, como interfaces de usuario o servicios de backend.  

### ¿Por qué usar Eventos?

- **Comunicación con el Mundo Exterior**: Los eventos permiten que los contratos inteligentes envíen información fuera de la blockchain.  
- **Eficiencia**: Registrar información a través de eventos es más económico en términos de gas que almacenar datos en variables de estado.  
- **Monitoreo**: Las aplicaciones pueden monitorear contratos en tiempo real, reaccionando a eventos específicos.  
- **Transparencia**: Proporcionan un historial público de acciones importantes dentro del contrato.  

---

## 2. Declarando Eventos

Para utilizar eventos en Solidity, primero debemos declararlos dentro del contrato.

### Sintaxis Básica

```solidity
event NombreDelEvento(tipoParametro nombreParametro, ...);
```

- **`event`**: Palabra clave que indica la declaración de un evento.  
- **`NombreDelEvento`**: Identificador único del evento.  
- **Parámetros**: Lista de tipos y nombres de parámetros que serán registrados con el evento.  

### Ejemplo de Declaración

```solidity
event Transferencia(address indexed de, address indexed para, uint256 valor);
```

- **Descripción**: Declara un evento llamado `Transferencia` que registra la dirección de origen (`de`), la dirección de destino (`para`) y el valor transferido (`valor`).  
- **`indexed`**: Modificador que permite filtrar eventos por estos parámetros al escucharlos externamente (hasta tres parámetros pueden ser indexados).  

### Observaciones sobre `indexed`

- Los parámetros marcados como `indexed` permiten que las aplicaciones externas filtren y busquen eventos específicos basados en estos valores.  
- Solo los tipos de datos simples pueden ser indexados (e.g., `address`, `uint`, `bytes32`).  

---

## 3. Emisión de Eventos

Una vez que un evento es declarado, podemos emitirlo en cualquier parte dentro de las funciones del contrato.

### Sintaxis para Emitir Eventos

```solidity
emit NombreDelEvento(valorParametro1, valorParametro2, ...);
```

- **`emit`**: Palabra clave utilizada para emitir un evento.  
- **`NombreDelEvento`**: Nombre del evento declarado previamente.  
- **Parámetros**: Valores que corresponden a los parámetros del evento.  

### Ejemplo de Emisión

```solidity
function transferir(address _para, uint256 _valor) public {
    require(saldos[msg.sender] >= _valor, "Saldo insuficiente.");

    saldos[msg.sender] -= _valor;
    saldos[_para] += _valor;

    emit Transferencia(msg.sender, _para, _valor);
}
```

- **Descripción**: Después de realizar la transferencia de fondos, el contrato emite el evento `Transferencia` con los detalles de la transacción.  

---

## 4. Escuchando Eventos Externamente

Aunque los contratos inteligentes no pueden acceder a los eventos, las aplicaciones externas pueden escucharlos y reaccionar a ellos.

### Cómo Escuchar Eventos

- **Bibliotecas**: Herramientas como **Web3.js**, **Ethers.js** o **Web3.py** permiten que las aplicaciones interactúen con la blockchain de Ethereum y escuchen eventos.  
- **Filtrado**: Las aplicaciones pueden filtrar eventos basados en parámetros indexados.  
- **Monitoreo en Tiempo Real**: Es posible configurar listeners que reaccionen inmediatamente cuando un evento es emitido.  

### Ejemplo con Web3.js

```javascript
const contrato = new web3.eth.Contract(abi, direccionContrato);

contrato.events.Transferencia({
    filter: { de: cuentaEspecifica }, // Opcional: filtrar por una dirección específica
    fromBlock: 'latest'
}, function(error, event) {
    if (error) {
        console.error(error);
    } else {
        console.log("Evento capturado:", event);
        // Reaccionar al evento, actualizar interfaz, etc.
    }
});
```

- **Descripción**: El código anterior configura un listener para el evento `Transferencia`, filtrando opcionalmente por una dirección específica.  

### Importancia para las Aplicaciones

- **Interactividad**: Permite que las interfaces de usuario actualicen información en tiempo real.  
- **Notificaciones**: Las aplicaciones pueden notificar a los usuarios sobre eventos relevantes.  
- **Integridad**: Garantiza que los datos presentados a los usuarios reflejan el estado actual de la blockchain.  

---

## Conclusión

En esta clase, exploramos el concepto de **eventos en Solidity**, entendiendo cómo son fundamentales para la comunicación entre contratos inteligentes y el mundo exterior. Aprendimos a declarar y emitir eventos dentro de nuestros contratos, y vimos cómo las aplicaciones externas pueden escuchar estos eventos para reaccionar a cambios en la blockchain.  

Los eventos son una herramienta poderosa para crear aplicaciones descentralizadas interactivas y responsivas, permitiendo que los usuarios y sistemas sigan en tiempo real las acciones que ocurren en los contratos inteligentes.  

---

## Resumen

1. **¿Qué son los Eventos en Solidity?**: Mecanismos para registrar información en la blockchain, comunicándose con aplicaciones externas.  
2. **Declaración de Eventos**: Uso de la palabra clave `event` seguida del nombre y parámetros.  
3. **Emisión de Eventos**: Utilización de `emit` dentro de las funciones del contrato para registrar eventos.  
4. **Escuchando Eventos Externamente**: Las aplicaciones usan bibliotecas como Web3.js para monitorear y reaccionar a eventos.  

---

## Tarea

Desarrolla un contrato llamado `Mercado` que permita que los usuarios compren y vendan artículos. Emite eventos cuando un artículo sea listado, vendido o eliminado del mercado. Asegúrate de indexar parámetros relevantes para facilitar la búsqueda y el filtrado.  

---

## Próxima Clase

En la próxima clase, exploraremos el concepto de **almacenamiento de datos** en Solidity.  
