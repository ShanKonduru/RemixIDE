// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "contracts/101_MathLibraries.sol";


contract SafeMultiplyProxy{
    using MathLibraries for uint;

    function multiplyProxy(uint256 _operand1, uint256 _operand2) public pure returns (uint256) {
            return _operand1.multiply(_operand2);
    }
}