// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract salaryCalculator {
    uint256 public basic = 0;
    uint256 public DA = 0;
    uint256 public HRA = 0;

    function setSalary(uint256 _basic, uint256 _DA, uint256 _HRA) public {
        basic = _basic;
        DA = _DA;
        HRA = _HRA;
    }

    function totalPay() public view returns(uint256) {
        return basic + (DA * basic/100 + (HRA * basic)/1);
    }
}