//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

contract tokens{
    uint public totalSupply = 10000;
    address payable public owner;
    mapping(address=>uint) public balances;
    event accountBalance(uint);
    constructor(){
        owner = payable(msg.sender);
    }
    modifier ownerOnly{
        require(msg.sender==owner,"you are not the owner");
        _;
    }
    function buyToken() public payable {
        require(msg.value>=1 ether,"pay 1 ether for each token");
        require(msg.value>=totalSupply, "Tokens are sold out");
        balances[msg.sender]+=msg.value/1000000000000000000;
        totalSupply-=msg.value/1000000000000000000;
    }
    function checkBalance() public {
        emit accountBalance(balances[msg.sender]);
    }
    function withdrawMoney() public payable ownerOnly{
        owner.transfer(address(this).balance);
    }
}
