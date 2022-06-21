//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.14;

contract AddressBook{
    mapping(string=>address) public record;
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    modifier ownerOnly{
        require(msg.sender==owner);
        _;
    }
    function registerAddress(address _address, string memory _name) public ownerOnly {
        record[_name] = _address;
    }
    function changeAddress(address _newAddress, string memory _name) public ownerOnly{
        record[_name] = _newAddress;
    }
    function changeName(address _address,string memory _oldName, string memory _newName) public ownerOnly{
        delete record[_oldName];
        record[_newName] = _address;
    }
}       
