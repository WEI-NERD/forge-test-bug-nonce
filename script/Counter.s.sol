// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import {Counter} from "src/Counter.sol";

contract CounterScript is Script, Test {
    function run() public {
        Account memory deployer = makeAccount("deployer");

        vm.startBroadcast(deployer.key);
        console2.log("nonce before is %s", vm.getNonce(deployer.addr));
        new Counter();
        console2.log("nonce after is %s", vm.getNonce(deployer.addr));
        vm.stopBroadcast();
    }
}
