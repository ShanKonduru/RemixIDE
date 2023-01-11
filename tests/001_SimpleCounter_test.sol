// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.

import "../contracts/UnitTests/001_SimpleCounter.sol";

contract testSuite {
    SimpleCounter public simpleCounter;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        simpleCounter = new SimpleCounter();
    }

    function checkIncrement() public {
        simpleCounter.increment();
        Assert.equal(
            simpleCounter.counter(),
            1,
            "increment() function did not yeild correct output. the count should be 1."
        );
    }

    function checkDecrement() public {
        simpleCounter.decrement();
        Assert.equal(
            simpleCounter.counter(),
            0,
            "decrement() function did not yeild correct output. the count should be 0."
        );
    }
}
