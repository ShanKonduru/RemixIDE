// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EtherManagement {
    mapping (address => uint256) public balances;
    address payable wallet; 

    constructor(address payable _wallet) {
        wallet = _wallet;
    }

    fallback () external {
        buyToken();
    }

    function buyToken() public payable  {
        // Buy a Token 
        balances[msg.sender] += 1;
        // Send Eth to a Wallet
        wallet.transfer(msg.value);
    }
}
