// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ERC20Token {
    string public name = "ShanToken";
    mapping (address => uint256) public balances;

    function mint() public {
        balances[tx.origin] += 1;
    }
}

contract ContractExample {
    address payable wallet; 
    address public token;

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    fallback () external  {
        buyToken();
    }

    function buyToken() public payable  {
        ERC20Token _ercToken = ERC20Token(address (token));
        _ercToken.mint();
        wallet.transfer(msg.value);
    }
}
