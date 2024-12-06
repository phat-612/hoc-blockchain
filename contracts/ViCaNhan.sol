// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract PersonWallet{
    address own;
    mapping (address => uint256) listDonate;
    address[] donors;
    constructor () {
        own = msg.sender;
    }
    function deposit () public payable {
        if (listDonate[msg.sender] == 0) {
            donors.push(msg.sender);
        }
        listDonate[msg.sender] += msg.value;
    }
    function withdraw() public  {
        payable (msg.sender).transfer(listDonate[msg.sender]);
    }
    function withdraw(uint256 value) public  {
        require(listDonate[msg.sender] <= value, 'Khong du tien trong vi');
        payable (msg.sender).transfer(value);
    }
}