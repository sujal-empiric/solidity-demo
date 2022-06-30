//SPDX-License-Identifier: GNU

pragma solidity ^0.8.0;

contract charity{
    address payable[] public recipients;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier ownerOnly{
        require(msg.sender == owner,"you are not the owner");
        _;
    }
    function addRecipients(address payable _addr) public ownerOnly{
        recipients.push(_addr);
    }
    receive() external payable {
        uint share = msg.value / recipients.length;
        for(uint i=0; i<recipients.length; i++){
            recipients[i].transfer(share);
        }
    }
    function sendMoney() public payable{
        uint share = msg.value / recipients.length;
        for(uint i=0; i<recipients.length; i++){
            recipients[i].transfer(share);
        }
    }
    function removeReipient(uint index) public ownerOnly{
        recipients[index] = recipients[recipients.length - 1];
        recipients.pop();
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}
