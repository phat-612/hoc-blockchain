// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
contract Bai2 {
    event MaxAndMin(uint256 minNumber, uint256 maxNumber);
    function findMinMax(uint256 a, uint256 b, uint256 c) public returns (uint256  , uint256) {
        require(a > 0 && b > 0 && c > 0 , "Phai nhap so duong");
        uint256 max = a;
        if (b > max){
            max = b;
        }
        if(c > max) {
            max = c;
        }
        uint256 min = a;
        if (b < min){
            min = b;
        }
        if(c < min) {
            min = c;
        }
        emit MaxAndMin(min, max);
        return (min, max);
    }
}