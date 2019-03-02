pragma solidity ^0.5.0;

contract VendingMachine{ 
    
    event payed(address _client, address _destinatary, uint value);
    
    function forward(address payable _destinatary)public payable{
        _destinatary.transfer(msg.value);
        emit payed(msg.sender, _destinatary, msg.value);
        
    }
    
}
