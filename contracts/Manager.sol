pragma solidity ^0.8.20;

interface Achievements {
    function claimAchievement(uint256 id, address user) external;
}

contract Manager {
    address owner;
    Achievements achievement;

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    constructor ()  {owner = msg.sender;}

    function isPoolOwner(address _address) isOwner public {
        achievement.claimAchievement(id, user);
    }

    function setAchievementsContract(address achievementContract) public isOwner {
        achievement = Achievements(achievementContract);
    }

}