const ShippingStatus = artifacts.require("Shipping");
const truffleAssert = require("truffle-assertions");

contract("Shipping", () => {
    let instance;

    beforeEach(async () => {
        instance = await ShippingStatus.deployed();
    });

    it("should return the status Pending", async () => {
        // Checking the initial status in our contract
        const status = await instance.Status();
        // Checking if the status is initially Pending (0 in enum)
        assert.equal(status, "Pending", "Initial status should be Pending");
    });

    it("should return the status Shipped", async () => {
        // Calling the Shipped() function
        await instance.Shipped();
        // Checking the status in our contract
        const status = await instance.Status();
        // Checking if the status is Shipped (1 in enum)
        assert.equal(status, "Shipped", "Status should be Shiped");
    });

    it("should return the status Delivered", async () => {
        // Calling the Delivered() function
        await instance.Delivered();
        // Checking the status in our contract
        const status = await instance.Status();
        // Checking if the status is Delivered (2 in enum)
        assert.equal(status, "Delivered", "Status should be Delivered");
    });

    it("should return correct event description", async () => {
        // Calling the Delivered() function
        const delivered = await instance.Delivered();
        // Check event description is correct
        truffleAssert.eventEmitted(delivered, "LogNewAlert", (event) => {
            return event.description === "Your package has arrived";
        });
    });
});
