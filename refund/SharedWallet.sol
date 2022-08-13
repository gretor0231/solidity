// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Allowance.sol";
import "./Locker.sol";

contract SharedWallet is Allowance, Locker {

    function withdrawFirstMoney(address payable _to, uint _number) public onwerOrAllowed(_number,firstWithdrawAmount) {
        require(firstWithdrawAmount <= address(this).balance, "There are not enough funds stored in the smart contract");
        require( lockerAllowance[_number].lockerFirst == false, "First Amount has been withdraw");
        if(owner() != _msgSender()){
            reduceAllowance(_number, firstWithdrawAmount);
            chengeFirstPermission(_number, true);
        }
        _to.transfer(firstWithdrawAmount);
    }

    function withdrawSecondMoney(address payable _to, uint _number) public onwerOrAllowed(_number,secondWithdrawAmount) {
        require(secondWithdrawAmount <= address(this).balance, "There are not enough funds stored in the smart contract");
        require( lockerAllowance[_number].lockerSecond == false, "Second Amount has been withdraw");
        if(owner() != _msgSender()){
            reduceAllowance(_number, secondWithdrawAmount);
            chengeSecondPermission(_number, true);
        }
        _to.transfer(secondWithdrawAmount);
    }

    function withdrawThirdMoney(address payable _to, uint _number) public onwerOrAllowed(_number,thirdWithdrawAmount) {
        require(thirdWithdrawAmount <= address(this).balance, "There are not enough funds stored in the smart contract");
        require( lockerAllowance[_number].lockerThird == false, "First Amount has been withdraw");
        if(owner() != _msgSender()){
            reduceAllowance(_number, thirdWithdrawAmount);
            chengeThirdPermission(_number, true);
        }
        _to.transfer(thirdWithdrawAmount);
    }

    function sendMeMoneyContract() external payable{

    }

    function balanceOf() external view returns(uint) {
        return address(this).balance;
    }

}