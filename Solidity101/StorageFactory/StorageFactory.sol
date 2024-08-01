// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listofSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listofSimpleStorage.push(newSimpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber)public{
        SimpleStorage mySimpleStorage = listofSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
   }

   function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
    SimpleStorage mySimpleStorage = listofSimpleStorage[_simpleStorageIndex];
    return  mySimpleStorage.retrieve();
    
   }
}
