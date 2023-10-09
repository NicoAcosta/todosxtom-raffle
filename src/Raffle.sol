// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Raffle {
    uint256 public constant PRIZES_AMOUNT = 10; // pending

    uint256 public immutable ticketsAmount = 10; // pending

    mapping(uint256 prizeNumber => uint256 ticketNumber) public winners;

    mapping(uint256 ticketNumber => bool) public alreadyWon;

    bool public alreadyRaffled;

    function raffle() external {
        require(!alreadyRaffled, "Already raffled");

        for (uint256 i = 1; i <= PRIZES_AMOUNT; i++) {
            _setWinner(i);
        }

        alreadyRaffled = true;
    }

    function _setWinner(uint256 prizeNumber) private {
        uint256 winnerTicketId;

        do {
            winnerTicketId = _randomId(prizeNumber);
        } while (alreadyWon[winnerTicketId]);

        winners[prizeNumber] = winnerTicketId;
        alreadyWon[winnerTicketId] = true;
    }

    function _randomId(uint256 i) private view returns (uint256) {
        return
            (uint256(
                keccak256(
                    abi.encodePacked(
                        blockhash(block.number),
                        block.timestamp,
                        msg.sender,
                        i
                    )
                )
            ) % ticketsAmount) + 1;
    }
}
