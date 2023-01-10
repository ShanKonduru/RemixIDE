// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract StructExample{
    uint256 public userCount = 0;
    mapping (uint => User ) public Users;
    struct User{
        uint _id;
        string _name;
        uint256 _balance;        
    }
    function addUser(string memory _name, uint256 _amt) public {
        userCount += 1;
        Users[userCount] = User(userCount, _name, _amt);
    }

}