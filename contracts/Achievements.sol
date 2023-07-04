pragma solidity ^0.8.20;

contract Achievements {
    address public owner;
    address public manager;

    Achievement[] public achievements;
    mapping (address => uint256[]) public usersAchievements;

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
       usersAchievements[user].push(id);
    }

    function setManager(address _address) isOwner public {
        manager = _address;
    }

    function achievementsCount() public view returns (uint256) {
        return achievements.length;
    }

    struct Achievement{
        uint256 id;
        string name;
        string description;
        string reward;
    }

}