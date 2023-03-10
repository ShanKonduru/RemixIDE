// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract TimeManagement {
    uint256 public userCount = 0; // number of users in the system at any time 
    address owner; // owner who deploys the Contract
    // https://www.epochconverter.com/
    uint256 openingTime = 1673363000; // Expressed in seconds: Tuesday, January 10, 2023 8:33:20 PM GMT+05:30
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyOpen() {
        require(block.timestamp >= openingTime);
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
        public onlyOwner onlyOpen 
        {
            incrementUserCount();
            Users[userCount] = User(userCount, _name, _amt);
    }
}
