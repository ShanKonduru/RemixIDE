// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract BaseContract  {
    string public name;
    
    mapping (address => uint256) public balances;
    
    constructor(string memory _name) {
        name = _name;
    }

    function mint() public virtual {
        balances[tx.origin] += 1;
    }
}

contract ChildContract is BaseContract {
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    constructor(
        string memory _name, 
        string memory _symbol
        ) 
        BaseContract(_name) 
        {
            symbol = _symbol;
        }
    function  mint() public  override{
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
}
