pragma solidity ^0.5.0;

/**
 * @title VendingMachine
 * @dev see https://github.com/scammi/VendingMachine
*/
import "zos-lib/contracts/Initializable.sol";


contract VendingMachine is Initializable {

   address owner;

//Triggers event when payment is completed
    event Paid(address _client, address _destinatary, uint _amountPay);

    function initialize() initializer public {
       owner = msg.sender;
    }

/**
*@dev fowards payments to owner of service
*triggers event when successfully foward payment
*@param _destinatary address belongs to the owner of the service
*/
    function forward(address payable _destinatary) public payable {
        _destinatary.transfer(msg.value);

        emit Paid(msg.sender, _destinatary, msg.value);

    }

}
