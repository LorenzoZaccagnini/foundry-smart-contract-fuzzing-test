// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract ContractTest is Test {
    uint256 testNumber;

    function setUp() public {
        testNumber = 9000;
    }

    function testFailNumberIs42() public {
        assertEq(testNumber, 42);
    }

    function testCannotSubtract() public {
        vm.expectRevert(stdError.arithmeticError);
        testNumber -= 10000;
    }

    function testCannotSubtractFuzz(uint256 myNumber) public {
        vm.assume(myNumber > 9000);
        vm.expectRevert(stdError.arithmeticError);
        testNumber -= myNumber;
    }
}
