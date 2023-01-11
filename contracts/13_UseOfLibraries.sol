// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract UseOfLibraries  {
    string public name;
    
    mapping (address => uint256) public balances;
    
    constructor(string memory _name) {
        name = _name;
    }

    function mint() public virtual {
        balances[tx.origin] += 1;
    }
}