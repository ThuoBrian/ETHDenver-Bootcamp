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
    event tranferTokensInfo(address _from, address _to, uint256 _amount);

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        if(msg.sender == owner)
        _;
    }
  
    function changeTotalSupply(uint256 _coins)public onlyOwner{
        uint256 coins;
        PaymentInfo.owner = msg.sender ;
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
        return getNumber[PaymentInfo.owner];
    }
    function getOwnerBalance()public view returns(uint256){
        uint256 balances;
        balances = PaymentInfo.coinsSupply - coinsSupply;
        return balances;
    }
    function tranferTokens(uint256 _amount, address _to) public returns(bool){
        address _from = msg.sender;
        owner = _to;
        emit tranferTokensInfo(_from,_to,_amount);
        return true;
    }
}