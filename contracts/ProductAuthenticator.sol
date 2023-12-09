// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductAuthenticator {
    address public owner;
    mapping(bytes32 => bool) public productAuthenticity;

    event ProductRegistered(bytes32 indexed productId);
    event ProductVerified(bytes32 indexed productId, bool isAuthentic);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerProduct(string memory productName) public onlyOwner {
        // Use the hash of the transaction as the productId
        bytes32 productId = keccak256(abi.encodePacked(blockhash(block.number - 1), productName));

        // Store the product authenticity status
        productAuthenticity[productId] = true;

        // Emit the registration event
        emit ProductRegistered(productId);
    }

    function verifyProduct(bytes32 productId) public view returns (bool) {
        return productAuthenticity[productId];
    }
}
