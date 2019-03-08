var VendingMachine = artifacts.require("VendingMachine.sol");

contract("First test", async accounts =>  {

    it("Forwards payment", async () => {
      let ins = await VendingMachine.deployed();

      let balance1 = await ins.getBalance.call(accounts[1]);

      let balance2 = await ins.getBalance.call(accounts[2]);
      
      assert.equal(balance1,balance2);
    });

});
