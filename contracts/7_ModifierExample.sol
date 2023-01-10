// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ModifierExample{
    uint256 public userCount = 0;
    mapping (uint => User ) public Users;
    struct User{
        uint _id;
        string _name;
        uint256 _balance;        
    }

    function incrementUserCount() internal {
        userCount += 1;
    }

    function addUser(string memory _name, uint256 _amt) public {
        incrementUserCount();
        Users[userCount] = User(userCount, _name, _amt);
    }
}