pragma solidity ^0.5.0;

/**
 * @title VendingMachine
 * @dev see https://github.com/scammi/VendingMachine
*/
import "node_modules/zos-lib/contracts/Initializable.sol";


contract VendingMachine is Initializable {

//Triggers event when payment is completed
    event Paid(address _client, address _destinatary, uint _amountPay);
    event GaveChange(address _client, uint _change);

/**
*@dev fowards payments to owner of service
*triggers event when successfully foward payment
*returns change when payment exceeds price
*@param _destinatary address belongs to the owner of the service
*@param _price uint the price of the service
*/
    function forward(address payable _destinatary, uint _price) public payable {
        require(msg.value >= _price, "Not enough was payed.");

        uint amountPaid = msg.value;

        if (amountPaid > _price) {
            uint change = (amountPaid - _price);

            msg.sender.transfer(change);

            _destinatary.transfer(_price);

            emit GaveChange(msg.sender, change);

        } else {
            _destinatary.transfer(amountPaid);

        }
        emit Paid(msg.sender, _destinatary, msg.value);

    }

}
