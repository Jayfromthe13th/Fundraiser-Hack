pragma solidity ^0.4.8;

contract Fundraiser{
    
    mapping(address => uint)Balance;
    
    function contribute() payable{
        Balance[msg.sender] += msg.value;
    }
    
    function withdraw(){
        if(Balance[msg.sender] == 0){
            throw;
        }
        if(msg.sender.call.value(Balance[msg.sender])()){
            Balance[msg.sender] = 0;
        }
        else{
            throw;
        }
    }
        function getFunds() returns (uint){
        return address(this).balance;
    }
}
