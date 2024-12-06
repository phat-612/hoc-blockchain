// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bai1{
    function checkNumber(uint256 number) public pure returns (string memory){
        if (number % 2 == 0){
            return "So chan";
        } else{
            return "So le";
        }
    }
}
