//)Print Hello Worlds
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld {
    string public greet = "Hello World";
    function prints()public {
        greet = "Hi";
    }
}