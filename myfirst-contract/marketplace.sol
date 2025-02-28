pragma solidity >0.7.0 <0.8.0;

contract Marketplace {
    address public seller;
    address public buyer;
    mapping (address => uint) public balances;


    event ListItem(address seller, uint price);
    event PurchasedItem(address seller, address buyer, unit price);

    enum StateType {
        ItemAvailable,
        ItemPurchased
    }

    StateType public State;

    constructor() public {
        seller = msg.sender;
        State = StateType.ItemAvailable;
    }

    function buy (address seller, address buyer, uint price) public payable {
        require(price <= balance[buyer], "Insufficient balance");
        State = StateType.ItemPurchased;
        balance[buyer] -= price;
        balances[seller] += price;

        emit PurchasedItem(seller, buyer, msg.value);
    }
}
