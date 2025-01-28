// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/extensions/AccessControlDefaultAdminRules.sol";

contract Token is ERC20Pausable, AccessControlDefaultAdminRules {
    bytes32 public constant MINTER = keccak256("MINTER");
    bytes32 public constant PAUSER = keccak256("PAUSER");
    bytes32 public constant ADMIN = keccak256("ADMIN");

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC20(_name, _symbol) AccessControlDefaultAdminRules(1 days, msg.sender) {
        _setRoleAdmin(MINTER, ADMIN);
        _setRoleAdmin(PAUSER, ADMIN);
    }

    event Mint(address indexed to, uint256 amount, string metadata);

    function mint(
        address to,
        uint256 amount,
        string calldata metadata
    ) public onlyRole(MINTER) {
        _mint(to, amount);
        emit Mint(to, amount, metadata);
    }

    function pause() public onlyRole(PAUSER) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER) {
        _unpause();
    }

    function grantMinter(address account) public {
        grantRole(MINTER, account);
    }

    function grantPauser(address account) public {
        grantRole(PAUSER, account);
    }

    function grantAdmin(address account) public {
        grantRole(ADMIN, account);
    }

    function revokeRole(bytes32 role, address account) public override {
        super.revokeRole(role, account);
    }

    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }
}