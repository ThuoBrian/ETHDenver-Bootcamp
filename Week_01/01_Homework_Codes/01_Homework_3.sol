// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

contract BootcampContract {
    
    uint256 number;

    address owner;

    mapping(address => uint256)getNumber;

       constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner{
        if(msg.sender == owner){

            return 0x000000000000000000000000000000000000dEaD;
        }
        return owner
    }

    function store(uint256 num) public onlyOwner{
        number = num;
    }

    function retrieve()public view returns(uint){
        return (number);
    }

    function getUserNumber(address user) public view returns(uint256){
        return getNumber[user];
    }
}