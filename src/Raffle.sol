// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Raffle {
    uint256 public constant PRIZES_AMOUNT = 10; // pending

    uint256 public immutable ticketsAmount = 10; // pending

    mapping(uint256 prizeNumber => uint256 ticketNumber) public winners;

    mapping(uint256 ticketNumebr => bool) public alreadyWon;
}
