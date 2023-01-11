// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

library MathLibraries {
    function multiply(uint256 _operand1, uint256 _operand2)
        internal
        pure
        returns (uint256)
    {
        if (_operand1 == 0 || _operand2 == 0) {
            return 0;
        }

        uint256 _result = _operand1 * _operand2;
        require(_result / _operand1 == _operand2);

        return _result;
    }
}
