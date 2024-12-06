// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Bai3{
    function ascSort(uint256[] memory array1) public pure returns (uint256[] memory) {
        uint256 lengthArr = array1.length;
        for (uint256 i = 0; i < lengthArr - 1 ; i++ ){
            for (uint256 j=i+1; j< lengthArr; j++){
                if (array1[i]> array1[j]){
                    (array1[i], array1[j]) = (array1[j], array1[i]);
                }
            }
        }
        return array1;
    }
}