var VendingMachine = artifacts.require("VendingMachine.sol");

contract("First test", async accounts =>  {

    it("Forwards payment", async () => {
      let ins = await VendingMachine.deployed();
      let value = 1e18;
      let balance2 = await ins.getBalance(accounts[1]);
      let balance1 = await ins.getBalance(accounts[2]);
      await ins.forward(accounts[2], {from: accounts[1], value:value });

      newBalance2 = balance2 + (value.bigNo());
      balance2 = balance.toString();
      newBalance2 = newBalance2.toString();
    //  balance1 = balance1.bigNo().toNumber();
    //  balance2 = balance2.bigNo().toNumber();

      assert.equal(balance2, newBalance2)

      //compare balance before trans and after trans
      //before = balance before
      //after trans = balance + value


      console.log(balance1, balance2);
    });

});
