const { ethers } = require('ethers')

const provider = new ethers.JsonRpcProvider('https://rpc.ankr.com/eth');

provider.getTransaction('')
  .then(transaction => {
    console.log(transaction);
  });

// provider.getBlock()
//   .then(block => {
//     console.log(block);
//   });