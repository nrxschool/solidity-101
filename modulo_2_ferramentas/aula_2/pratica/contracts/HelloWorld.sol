// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.27;

contract HelloWorld {

    string private message;

    constructor() {}

    function updateMessage(string memory newMessage) public {
        message = newMessage;
    }

    function helloWorld() public view returns (string memory) {
        return message;
    }
}
