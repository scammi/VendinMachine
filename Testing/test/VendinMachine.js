var VendingMachine = artifacts.require("./VendingMachine.sol");

contract("VendingMachingTest", async accounts => {
  it("should fowar msg.value to _destinatary", async () =>{
    let ins = await VendingMachine.deployed();
    let a = 1;
    let b = 2;
    assert.equal(a,b);
  });
});
