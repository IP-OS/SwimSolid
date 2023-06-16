pragma solidity ^0.8.20;

contract Achievements {
    address owner;
    address manager;

    Achievement[] public achievements;
    mapping (uint256 => address[]) public usersAchievements;

    constructor () {owner = msg.sender;}

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    modifier isManager {
        require(msg.sender == manager);
        _;
    }

    function createAchievement(string memory name, string memory description, string memory reward) public isOwner {
        achievements.push(Achievement(achievements.length, name, description, reward));
    }

    function claimAchievement(uint256 id, address user) isManager public {
       usersAchievements[id].push(address);
    }

    function setManager(address _address) isOwner public {
        manager = _address;
    }

    struct Achievement{
        uint256 id;
        string name;
        string description;
        string reward;
    }

}