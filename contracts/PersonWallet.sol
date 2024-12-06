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
        require(own == msg.sender, 'sai dia chi vi');
        payable (msg.sender).transfer(address(this).balance);
    }
    function withdraw(uint256 value) public  {
        require(own == msg.sender, 'sai dia chi vi');
        payable (msg.sender).transfer(value);
    }
   function getAllDonations() public view returns (address[] memory, uint256[] memory) {
        uint256[] memory amounts = new uint256[](donors.length);
        for (uint256 i = 0; i < donors.length; i++) {
            amounts[i] = listDonate[donors[i]];
        }
        return (donors, amounts);
    }


}