# VendingMachine
EVM package that manages service fees 


Using web3, a transaction is constructed to the VendingMachine contract with the following information.
 -Recipient address
 -Amount to be paid
 -Item bought
 -Etc
  
The smart contract that will forward the eth it receives to the recipient, it will also trigger an event, with the information passed, where the listening page can react to.
This allows for the construction of webpage service that reacts to payment without the need to deploy its own ethereum logic. 

Uses cases.
- Donations
- Saving to IPFS after paying
- Online store
