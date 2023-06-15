pragma solidity ^0.8.20;

import "@0x/contracts-erc20/contracts/src/ERC20Token.sol";

contract Achievements {
    address owner;
    address manager;

    mapping (uint256 => Achievement) public achievements;
    mapping (uint256 => address) public usersAchievements;

    constructor () public {}

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    
    modifier isManager {
        require(msg.sender == manager);
        _;
    }

    function createAchievement(string name, string description, string reward) public isOwner {
        achievements[len(achievements)] = Achievement(name, description, reward);
    }

    function claimAchievement(uint256 id, address user) isManager public {}

    function setManager(address _address) isOwner {
        manager = _address;
    }

    struct Achievement{
        string name;
        string description;
        string reward;
    }

}