// SPDX-License-Identifier: GPL-3.0

// pragma solidity ^0.6.0;

// contract TestOverFlow {
//     function testOverflow() public pure returns (uint8) {
//         uint8 x = 255;
//         // 这里会返回 0
//         return x + 1;
//     }
// }

pragma solidity ^0.8.0;

contract TestOverFlow {
    function testOverflow() public pure returns (uint8) {
        uint8 x = 255;
        // 这里会 revert, 因为 0.8.0 修复了溢出的漏洞
        return x + 1;
    }
}