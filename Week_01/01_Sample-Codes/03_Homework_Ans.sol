// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BootcampContract {
    
    uint256 public number;

    address public owner;

    mapping(address => uint256)getNumber;

    modifier onlyOwner{
        if(msg.sender == owner){
            _;
        }
    }

    constructor() {
        owner = msg.sender;
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