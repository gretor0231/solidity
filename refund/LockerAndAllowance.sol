// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LockerAndAllowance {

    uint256 public firstWithdrawAmount = 1 ether;
    uint256 public secondWithdrawAmount = 2 ether;
    uint256 public thirdWithdrawAmount = 3 ether;

    mapping(uint256 => LockerStruct) public lockerAllowance;

    struct LockerStruct{
        uint256 allowance;
        bool lockerFirst;
        bool lockerSecond;
        bool lockerThird;
    }
}

