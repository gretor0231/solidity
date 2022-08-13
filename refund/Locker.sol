// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./LockerAndAllowance.sol";

contract Locker is LockerAndAllowance {

    function chengeFirstPermission(uint _number, bool _lock) internal {
        require(_lock == true, "You are not allow to change locker permission");
        lockerAllowance[_number].lockerFirst = _lock;
    }

    function chengeSecondPermission(uint _number, bool _lock) internal {
        require(_lock == true, "You are not allow to change locker permission");
        lockerAllowance[_number].lockerSecond = _lock;
    }

    function chengeThirdPermission(uint _number, bool _lock) internal {
        require(_lock == true, "You are not allow to change locker permission");
        lockerAllowance[_number].lockerThird = _lock;
    }

}
