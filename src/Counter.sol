// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library A {
    function a() public pure returns (uint256) {
        return 1;
    }
}

library B {
    function b() public pure returns (uint256) {
        return 2;
    }
}

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function lib() public pure returns (uint256, uint256) {
        uint256 a = A.a();
        uint256 b = B.b();
        return (a, b);
    }
}
