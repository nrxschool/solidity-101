// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract LittleTiger {
    address public owner;
    address payable[] public players;
    uint256 public lotteryId;
    mapping(uint256 => address payable) public lotteryHistory;

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    function enter() public payable {
        require(msg.value == .01 ether, "Valor de entrada deve ser maior que 0.01 ether");
        players.push(payable(msg.sender));
    }

    function getRandomNumber() public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    function pickWinner() public onlyOwner {
        uint256 index = getRandomNumber() % players.length;
        players[index].transfer(address(this).balance);

        lotteryHistory[lotteryId] = players[index];
        lotteryId++;

        // Reset the lottery
        players = new address payable[](0);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Somente o dono pode chamar essa funcao");
        _;
    }
}
