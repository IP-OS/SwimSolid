pragma solidity ^0.8.20;

import "@0x/contracts-erc20/contracts/src/ERC20Token.sol";
import "Achievement.sol";

contract Achievements is ERC20Token {
    address owner;
    address manager;

    mapping achievements(uint256 => Achivement) public;
    mapping usersAchievements(uint256 => address) public;

    constructor () public {}

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    
    modifier isManager {
        require(msg.sender == manager);
        _;
    }

    createAchievement(name: string, description: string, reward: string)

    claimAchievement(id:uint256, user:address) isManager

    setManager(_address: address) isOwner {
        manager = _address
    }

}