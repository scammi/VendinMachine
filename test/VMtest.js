var VendingMachine = artifacts.require("VendingMachine.sol");


contract("VendingMachine", async accounts =>  {

    it("Forwards payment function test", async () => {
      let ins = await VendingMachine.deployed();
      let sender = accounts[1];
      let receiver = accounts[2];
      let value = 1000000000000000000;
      let balanceSenderBeforeTx = Number(await web3.eth.getBalance(accounts[1]));
      let balanceReceiverBeforeTx = Number(await web3.eth.getBalance(accounts[2]));


      let receipt = await ins.forward(receiver,{from:sender, value:value});

      let balanceReceiverAfterTx = Number(await web3.eth.getBalance(accounts[2]));
      let balanceSenderAfterTx = Number(await web3.eth.getBalance(accounts[1]));
      let gasUsed = receipt.receipt.gasUsed;
      let tx = await web3.eth.getTransaction(receipt.tx);
      let gasPrice = tx.gasPrice;


      assert.equal((balanceSenderAfterTx + value + (gasPrice*(gasUsed))), balanceSenderBeforeTx, "Sent correctly");
      assert.equal((balanceReceiverBeforeTx + value),balanceReceiverAfterTx, "Receive correctly");
    });

});
