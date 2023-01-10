// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract  MyFirstContract{
    string value;

     constructor() {
        value = "Shan Konduru - The King of Kings";
    }

    function get() public view returns (string memory) {
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }
}