const { 
  Web3
  } = require("web3");
  
  // Configurando el proveedor para conectarse a la red Polygon
  const web3 = new Web3("https://rpc-amoy.polygon.technology/");
  
  // Configurando la ABI y la dirección del contrato
  const direccionContrato = "0x89b81F2bE61200a483CE71D0b239dba16eE32Ac8"; // Inserta la dirección del contrato aquí
  const abiContrato = [
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {
          "internalType": "address payable",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ];
  
  // Creando una instancia del contrato
  
  async function main() {
    // Instancia del contrato
    const contratoLock = new web3.eth.Contract(abiContrato, direccionContrato);
  
    try {
        // Llamando a la función `owner` para obtener la dirección del propietario
        const propietario = await contratoLock.methods.owner().call();
        console.log("Dirección del Propietario:", propietario);
    } catch (error) {
        console.error("Error al llamar a la función owner:", error);
    }
  }
  
  main();
  