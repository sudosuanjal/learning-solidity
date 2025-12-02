// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


contract SimpleStorage{
    uint256 favoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person[] listOfPersons;

    mapping (string => uint256) public nameToNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function viewFavoriteNumber() public  view returns(uint256)  {
        return favoriteNumber;
    }


    function storePerson(uint256 _favoriteNumebr, string memory _name) public {
        listOfPersons.push(Person(_favoriteNumebr, _name));
        nameToNumber[_name] = _favoriteNumebr;
    }
}
