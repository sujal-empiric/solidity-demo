//SPDX-License-Identifier: GNU

pragma solidity 0.8.0;

contract Rent{
    uint public ammount;
    address payable public owner;
    event rentReceived(uint,address,uint);
    constructor(uint _ammount){
        owner = payable(msg.sender);
        ammount = _ammount*1e18;
    }
    modifier ownerOnly{
        require(msg.sender==owner, "you are not the owner");        
        _;
    }
    function payRent() payable public{
        require(msg.sender!=owner," you are the owner you can't pay rent");
        require(msg.value==ammount,"pay full rent");
        emit rentReceived(msg.value,msg.sender,block.timestamp);
    }
    function fetchRent() public ownerOnly{
        owner.transfer(address(this).balance);
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function contractFinished() public ownerOnly{
        selfdestruct(owner);
    }
}
