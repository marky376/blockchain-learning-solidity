// SPDX-License-Identifier: MIT
pragma solidity >0.4.25 <0.9.0;

contract Shipping {
    // Our predefined values for shipping listed as enums
    enum ShippingStatus { Pending, Shipped, Delivered }

    // Save enum ShippingStatus in variable status
    ShippingStatus private status;

    // Event to launch when package has arrived
    event LogNewAlert(string description);

    // This initializes our contract state (sets enum to Pending once the program starts)
    constructor() {
        status = ShippingStatus.Pending;
    }

    // Function to change to Shipped
    function Shipped() public {
        status = ShippingStatus.Shipped;
        emit LogNewAlert("Your package has been shipped");
    }

    // Function to change to Delivered
    function Delivered() public {
        status = ShippingStatus.Delivered;
        emit LogNewAlert("Your package has arrived");
    }

    // Renamed the function to getStatus() and updated its logic
    function getStatus() public view returns (string memory) { // Change 1: updated function signature
        if (status == ShippingStatus.Pending) return "Pending"; // Change 2: return string for Pending
        if (status == ShippingStatus.Shipped) return "Shipped"; // Change 3: return string for Shipped
        if (status == ShippingStatus.Delivered) return "Delivered"; // Change 4: return string for Delivered
        return "Unknown Status"; // Optional: handles case if status is somehow not set
    }



    // Get status of your shipped item
    function Status() public view returns (string memory) {
        return getStatus();
    }
}

