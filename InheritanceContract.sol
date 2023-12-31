/**
 *Submitted for verification at Etherscan.io on 2023-12-31
*/

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract InheritanceContract {
    address public owner;
    address public preSetAddress;
    uint public lastCalledBlock;

    constructor(address _preSetAddress) {
        owner = msg.sender;
        preSetAddress = _preSetAddress;
        lastCalledBlock = block.number;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action.");
        _;
    }

    function still_alive() public onlyOwner {
        lastCalledBlock = block.number;
    }

    function checkAndUpdate() public {
    require(block.number - lastCalledBlock > 10, "The owner has recently called still_alive.");
    (bool success, ) = preSetAddress.call{value: address(this).balance}("");
    require(success, "Transfer failed");
}
}
