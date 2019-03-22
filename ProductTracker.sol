pragma solidity ^0.4.2;

contract ProductTracker {
    struct Product {
        bool conditionGood;
        uint8 weight;
        unit8 latitude;
        unit8 longitude;
    }

    mapping(uint8 => Product) private ProductBox;
    mapping(address => mapping(uint8 =>bool)) private ProductOwner;
    event ProductMfg (address account, uint8 id);
    event ProductTransfer (address from, address to, uint8 id);

    function MfgProduct(uint8 id, bool conditionGood, uint8 weight, unit8 latitude, unit8 longitude;) public {
        ProductBox[id] = Product(conditionGood, weight, latitude, longitude);
        ProductOwner[msg.sender][id] = true;
        emit ProductMfg(msg.sender, id);
    }

    function transferProduct(address to, uint8 id) public {
        ProductOwner[msg.sender][id] = true;
        ProductOwner[to][id] = true;
        emit ProductTransfer(msg.sender, to, id);
    }

    function getProductByID(uint8 id) public constant returns(bool, uint8, uint8, uint8){
        return (ProductBox[id].conditionGood, ProductBox[id].weight, ProductBox[id].latitude, ProductBox[id].longitude);
        }

}