var VendingMachine = artifacts.require("VendingMachine.sol");


contract("First test", async accounts =>  {

    it("Forwards payment", async () => {
      let ins = await VendingMachine.deployed();
      let sender = accounts[1];
      let receiver = accounts[2];
      let value = 1000000000000000000;
      let balanceSenderBeforeTx = Number(await web3.eth.getBalance(accounts[1]));

      let receipt = await ins.forward(receiver,{from:sender, value:value});

      let balanceSenderAfterTx = Number(await web3.eth.getBalance(accounts[1]));
      let gasUsed = receipt.receipt.gasUsed;
      let tx = await web3.eth.getTransaction(receipt.tx);
      let gasPrice = tx.gasPrice;


    //  console.log(newBalanceAfter+finalSent);
        console.log(balanceSenderAfterTx + value + (gasPrice*(gasUsed)), balanceSenderBeforeTx)

      assert.equal(balanceSenderAfterTx + value + (gasPrice*(gasUsed)), balanceSenderBeforeTx, "Must be equal");
    });

});
