// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

error Unauthorized();

contract ContractA {
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

contract ContractATest is Test {
    ContractA contracta;
    uint256 testNumber;

    function setUp() public {
        contracta = new ContractA();
        testNumber = 9000;
    }

    function testIsOwnerIncrement() public {
        contracta.increment();
    }

    function testIsNotOwnerIncrement() public {
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        contracta.increment();
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
