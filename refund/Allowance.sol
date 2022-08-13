// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./LockerAndAllowance.sol";

contract Allowance is Ownable, LockerAndAllowance {

    using SafeMath for uint256;

    function addAllowanceFirst(uint256 _number) public onlyOwner {
        addAllowance(_number, firstWithdrawAmount);
    }

    function addAllowanceSecond(uint256 _number) public onlyOwner {
        addAllowance(_number, secondWithdrawAmount);
    }

    function addAllowanceThird(uint256 _number) public onlyOwner {
        addAllowance(_number, thirdWithdrawAmount);
    }

    function addAllowance(uint256 _number, uint256 _amount) internal onlyOwner {
        lockerAllowance[_number].allowance = lockerAllowance[_number].allowance.add(_amount);
    }

    modifier onwerOrAllowed(uint256 _number, uint256 _amount){
        require(owner() == _msgSender() || lockerAllowance[_number].allowance >= _amount, "You are not allowed");
        _;
    }

    function reduceAllowance(uint256 _number, uint256 _amount) internal {
        lockerAllowance[_number].allowance = lockerAllowance[_number].allowance.sub(_amount);
    }
}