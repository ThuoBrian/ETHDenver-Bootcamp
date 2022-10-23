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
  
    function getChangeSupply(uint256 _coins)public onlyOwner{
        uint256 coins;
        PaymentInfo.owner = 0x000000000000000000000000000000000000dEaD;
        coins = coinsSupply + _coins;
        PaymentInfo.coinsSupply = coins;
        emit logChangeSupply(PaymentInfo.coinsSupply);
    }
    function getTotalSupply() public view returns(uint256){
        return PaymentInfo.coinsSupply;
    }

    function getPaymentInfo() public view returns(uint256){
        return PaymentInfo.coinsSupply;
    }
    function getUserNumber() public view returns(uint256){
        return getNumber[owner];
    }
}
