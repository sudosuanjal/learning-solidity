// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {PrizeConverter} from "./prizeConverter.sol";

error notOwner();
contract FundMe{
    using PrizeConverter for uint256;
    address[] funders;
    mapping (address funder => uint256) addressToAmount;

    address immutable i_owner;
    uint256 public constant MINIMUM_USD = 10 * 1e18; 

    constructor(){
        i_owner = msg.sender;
    }

    function fund() payable public {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "your fund is not enough");
        funders.push(msg.sender);
        addressToAmount[msg.sender] = addressToAmount[msg.sender] + msg.value;
    }

    modifier onlyOnwer(){
        if(msg.sender != i_owner) revert notOwner();
        _;
    }

    function withdraw() public onlyOnwer{
        for(uint256 index=0; index<funders.length; index++){
            address funder = funders[index];
            addressToAmount[funder] = 0;
        }

        funders = new address[](0);

        (bool success, ) = payable(msg.sender).call{value:address(this).balance}("");
        require(success, "call failed");
    }
}
