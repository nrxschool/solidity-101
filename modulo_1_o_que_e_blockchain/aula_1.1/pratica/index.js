const { ethers } = require('ethers')

const provider = new ethers.JsonRpcProvider('https://rpc.ankr.com/eth');

provider.getTransaction('0x04dd84be579e1b5571a92d419638d1d04a542ebba14663dad9efd1488cd61e69')
  .then(transaction => {
    console.log(transaction);
  });

// provider.getBlock(21058133)
//   .then(block => {
//     console.log(block);
//   });