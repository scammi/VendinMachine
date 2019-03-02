pragma solidity ^0.5.0;

contract VendingMachine{ 
    
    event payed(address _client, address _destinatary, uint _amountPayed);
    
    function forward(address payable _destinatary, uint _price)public payable{
        require(msg.value >= _price, "Not enough was payed.");
    
        uint amountPayed = msg.value;
        
        if (amountPayed > _price){
            uint change = (amountPayed - _price);
            
            msg.sender.transfer(change);
            
            _destinatary.transfer(_price);
        
        } else {
        _destinatary.transfer(amountPayed);
    
        }
        
    emit payed(msg.sender, _destinatary, msg.value);

    }
    
}



    

    



