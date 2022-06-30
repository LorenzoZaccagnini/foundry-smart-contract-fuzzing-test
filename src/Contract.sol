// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

error Unauthorized();

contract Contract {
    uint256 testNumber;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function increment() public {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        testNumber++;
    }
}
