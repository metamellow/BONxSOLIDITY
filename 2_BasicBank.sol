// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract BasicETHBank{
    mapping(address => uint256) public bankBalances;

    function depositETH() external payable{
        bankBalances[msg.sender] += msg.value;
    }

    function withdrawETH(uint _amount) public{
        uint userBalance = bankBalances[msg.sender];
        require(userBalance >= _amount, "Error1 - Withdraw canceled");
        bankBalances[msg.sender] = userBalance - _amount;
        (bool success, ) = msg.sender.call{value: userBalance}("");
        require(success, "Error2 - Withdraw canceled");
    }
}
