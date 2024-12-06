// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract HouseManager{
    struct House{
        uint256 id;
        string house_address;
        address owner;
    }
    uint256 private nextId;
    House[] public houses;
    mapping (uint256 => address) owners;

    event HouseAdded(uint256 id, string house_address, address owner);
    event HouseDeleted(uint256 id ,address owner);
    event HouseEdited(uint256 id ,string house_address_new, address owner);

    function addHouse(string memory _house_address) public {
        House memory newHouse = House({
            id: nextId,
            house_address: _house_address,
            owner: msg.sender
        });
        
        houses.push(newHouse);
        owners[nextId] = msg.sender;

        emit HouseAdded(
            newHouse.id, 
            newHouse.house_address , 
            owners[newHouse.id]
        );
        nextId++;  
    }
    function deleteHouse(uint256 _id) public {
        require(msg.sender == owners[_id], "Ban khong phai la chu nha");
        for (uint256 i = 0 ; i < houses.length; i++ ){
            if(houses[i].id == _id){
                houses[i] = houses[houses.length - 1];
                houses.pop();
                break ;
            }
        }
        delete owners[_id];
        emit HouseDeleted(_id, msg.sender);
    }
    function editHouse(uint256 _id, string memory _house_address_new) public {
        require(msg.sender == owners[_id], "Ban khong phai la chu nha");
        for (uint256 i = 0 ; i < houses.length; i++ ){
            if (houses[i].id == _id){
                houses[i].house_address = _house_address_new;
                break ;
            }
        }
        emit HouseEdited(_id, _house_address_new, msg.sender);
    }
    function getHouses() public  view returns (House[] memory){
        return houses;
    }
}