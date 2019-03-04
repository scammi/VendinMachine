pragma solidity ^0.5.0;

/**
 * @title VendingMachine 
 * @dev see https://github.com/scammi/VendingMachine
*/
import "zos-lib/contracts/Initializable.sol";

contract VendingMachine is Initializable{ 
   
//Triggers event when payment is completed
    event payed(address _client, address _destinatary, uint _amountPay);
/**
*@dev contructor initialize sets owner of the contract to the deployer
*/
    function initialize() initializer public {
       address owner = msg.sender;  
    }
/**
*@dev fowards payments to owner of service
*triggers event when successfully paid
*returns change when payment exceeds price 
*@param _destinatary address belongs to the owner of the service
*@param _price uint the price of the service
*/ 
    function forward(address payable _destinatary, uint _price) public payable{
        require(msg.value >= _price, "Not enough was payed.");
    
        uint amountPaid = msg.value;
        
        if (amountPaid > _price){
            uint change = (amountPaid - _price);
            
            msg.sender.transfer(change);
            
            _destinatary.transfer(_price);
        
        } else {
        _destinatary.transfer(amountPaid);
    
        }
        
    emit payed(msg.sender, _destinatary, msg.value);

    }
    
}



    

    



