// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    
    address owner;
    uint256 coinsSupply = 10000;
    mapping(address => uint256)getNumber;
    
    struct Payment{
        uint256 coinsSupply;
        address owner;
    }
    
    Payment PaymentInfo;

    event logChangeSupply(uint256); 

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        if(msg.sender == owner)
        _;
    }
        function getTotalSupply() public view returns(uint256){
        return coinsSupply;
    }
       function getChangeSupply(uint256 _coins)public onlyOwner{
        uint256 coins;
        coins = coinsSupply + _coins;
        coinsSupply = coins;
        emit logChangeSupply(coinsSupply);
    }

    function getPaymentInfo() public view returns(uint256){
        return PaymentInfo.coinsSupply;
    }
    function getUserNumber() public view returns(uint256){
        return getNumber[owner];
    }
}

