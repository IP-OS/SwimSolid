pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


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

    constructor (address achievementContract)  {
        owner = msg.sender;
        achievement = Achievements(achievementContract);
    }



    function isPoolOwner(address _poolAddress, address _address) public isOwner {
        require(IERC20(_poolAddress).balanceOf(_address) > 0, "Not a Pool holder");
        achievement.claimAchievement(0, _address);
    }

}