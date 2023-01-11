// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract SimpleCounter{
    uint public counter;
    function increment() external {
        counter++;
    }

    function decrement() external {
        counter--;
    }
}