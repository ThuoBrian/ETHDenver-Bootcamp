// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.0;

contract VolcanoCoin {
    
    uint public supply;
    address owner;
    
    struct Payment {
        uint amount;
        address recipient;
    }
    mapping(address => uint) public balances;
    mapping(address => Payment[]) payments;
    
    event supplyChanged(uint);
    event tokensTransfered(uint, address);
    
    constructor() {
        owner = msg.sender;
        balances[owner] = 10000;
    }
    
    modifier onlyOwner() {
        if (msg.sender==owner) {
            _;
        }
    }
    
    function increaseSupply() public onlyOwner {
        supply+=1000;
        emit supplyChanged(supply);
    }
    
    function getPayments(address _user) public view returns (Payment[] memory) {
        return payments[_user];
    }
    
    function transfer(uint _amount, address _recipient) public {
        require(balances[msg.sender] >= _amount);
        balances[_recipient] += _amount;
        balances[msg.sender] -= _amount;
        emit tokensTransfered(_amount, _recipient);
        payments[msg.sender].push(Payment({
            amount: _amount,
            recipient: _recipient
        }));
    }
}