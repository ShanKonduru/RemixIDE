// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EventsExample {
    mapping (address => uint256) public balances;
    address payable wallet; 

    event purchase (
        address indexed _buyer, 
        uint256 _amount);

    constructor(address payable _wallet) {
        wallet = _wallet;
    }

    fallback () external  {
        buyToken();
    }

    function buyToken() public payable  {
        // Buy a Token 
        balances[msg.sender] += 1;
        // Send Eth to a Wallet
        wallet.transfer(msg.value);

        emit purchase(msg.sender, msg.value);
    }
}
