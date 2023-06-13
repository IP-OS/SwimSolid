// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.9;

import "@0x/contracts-erc20/contracts/src/ERC20Token.sol";


contract Achievements is ERC20Token {

    mapping public achievements;
    mapping public usersAchievements;

    constructor () public {}

    createAchievement(name: string, description: string, reward: string)

    claimAchievement(id:uint256, user:address) isManager

    addManager(_address: address) isOwner

}