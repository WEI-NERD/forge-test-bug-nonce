// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function test_Nonce() public {
        Account memory deployer = makeAccount("deployer");

        startHoax(deployer.addr);
        console2.log("nonce before is %s", vm.getNonce(deployer.addr));
        counter = new Counter();
        console2.log("nonce after is %s", vm.getNonce(deployer.addr));

        console2.log("Counter deployed at %s", address(counter));
    }
}
