// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ModifierExample {
    uint256 public userCount = 0;
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    mapping(uint256 => User) public Users;
    struct User {
        uint256 _id;
        string _name;
        uint256 _balance;
    }

    constructor() {
        owner = msg.sender;
    }

    function incrementUserCount() internal {
        userCount += 1;
    }

    function addUser(
        string memory _name, 
        uint256 _amt
        ) 
        public onlyOwner 
        {
            incrementUserCount();
            Users[userCount] = User(userCount, _name, _amt);
    }
}
