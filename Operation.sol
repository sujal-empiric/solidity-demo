//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Operation {
    address payable public Doctor;
    address payable public Patient;
    address payable public Hospital;
    bool public isOperating;
    bool public isSuccess;
    bool public isFailed;
    uint public time;
    constructor(){
        Hospital=payable(msg.sender);
    }
    function createOperation() public payable{
        require(msg.sender==Hospital,"You are not a valid Hospital Admin");
        require(Doctor!=address(0x00),"Add Doctor");
        require(Doctor!=address(0x00),"Add Patient");
        require(msg.value>=1 ether,"Add Approptiate ammount");
        isOperating=true;
    }
    function addDoctor() public payable{
        require(msg.value>=1 ether, "Add 1 or More Ether");
        Doctor = payable(msg.sender);
    }
    function addPatient() public payable{
        require(msg.value>=1 ether, "Add 1 or more Ether");
        Patient = payable(msg.sender);
    }
    function operationSuccess() public {
        require(msg.sender==Patient || msg.sender==Doctor,"You are not the Patient nor the Doctor");
        if(msg.sender==Patient){
            uint share = address(this).balance / 2;
            Hospital.transfer(share);
            Doctor.transfer(share);
            isSuccess=true;
        }
        if(msg.sender==Doctor){
            isSuccess=true;
            time = time + 1 minutes;
        }
    }
    // Patient accepts that the Operation is Done successfully
    function acceptOperationSuccess() public {
        require(msg.sender==Patient,"You are not the patient");
        uint share = address(this).balance / 2;
        Hospital.transfer(share);
        Doctor.transfer(share);
    }
    //Doctor Accepting that the operation is not successfull
    function operationFailed() public{
        require(msg.sender==Patient || msg.sender==Doctor, "You are not the Patient not the Doctor");
        if(msg.sender==Doctor){
            uint share = address(this).balance / 2;
            Hospital.transfer(share);
            Patient.transfer(share);
        }
        if(msg.sender==Patient){
            isFailed=true;
            time = time + 1 minutes; //time depends on the hospital policy
        }
    }
    //Patient Calling 
    function claimOperationFailed() public {
        require(block.timestamp>time,"You can't claim it now");
        uint share = address(this).balance / 2;
        Hospital.transfer(share);
        Patient.transfer(share);
    }
    //Doctor Calling
    function claimOperationSuccess() public {
        require(block.timestamp>time,"you can't claim it now");
        uint share = address(this).balance / 2;
        Hospital.transfer(share);
        Doctor.transfer(share);
    }
}
