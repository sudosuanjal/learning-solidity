// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {SimpleStorage} from "./simpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listOfSimpleStoragex;

    function createSimpleStorage() public{
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStoragex.push(newSimpleStorage);
    }

    function factoryStore(uint256 _favoriteNumber, uint256 _smartContractIndex) public {
        listOfSimpleStoragex[_smartContractIndex].store(_favoriteNumber);
    }

    function factoryRetrive(uint256 _smartContractIndex) public view returns(uint256){
       return listOfSimpleStoragex[_smartContractIndex].viewFavoriteNumber();
    }
}
