// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "remix_tests.sol"; // this import is automatically injected by Remix.

import "contracts/101_MathLibraries.sol";
import "contracts/101_SafeMultiplyProxy.sol";

contract SafeMultiplyTest {
    SafeMultiplyProxy safeMultiplyProxy;

    function BeforeAll() public {
        safeMultiplyProxy = new SafeMultiplyProxy();
    }

    function unsafeMultiplicationShouldOverflow() public returns (bool){
        uint256 _operand1 = 4;
        uint256 _operand2 = 2 ** 256 - 1;


        return  (_operand1 * _operand2 == 2**256 - 4);
    }

}
