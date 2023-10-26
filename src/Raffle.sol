// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error NonDeployer();
error AlreadyRaffled(uint256 alreadyRaffled);

contract Raffle {
    event NewRaffle(
        uint256 timestamp,
        uint256 prizeNumber,
        uint256 ticketNumber,
        string csvsIpfsHash
    );

    mapping(uint256 prizeNumber => bool) public alreadyRaffled;

    mapping(uint256 prizeNumber => uint256 ticketNumber) public winners;

    mapping(uint256 prizeNumber => string ipfsHas) public csvs;

    address public immutable deployer;

    constructor() {
        deployer = msg.sender;
    }

    function raffle(
        uint256 prizeNumber,
        string memory csvsIpfsHash,
        uint256 totalTickets
    ) external {
        if (msg.sender != deployer) revert NonDeployer();

        if (alreadyRaffled[prizeNumber]) revert AlreadyRaffled(prizeNumber);

        uint256 _winnerTicketId = _randomId(prizeNumber, totalTickets);

        winners[prizeNumber] = _winnerTicketId;

        csvs[prizeNumber] = csvsIpfsHash;

        alreadyRaffled[prizeNumber] = true;

        emit NewRaffle(
            block.timestamp,
            prizeNumber,
            _winnerTicketId,
            csvsIpfsHash
        );
    }

    function _randomId(
        uint256 _prizeNumber,
        uint256 _totalTickets
    ) private view returns (uint256) {
        return
            (uint256(
                keccak256(
                    abi.encodePacked(
                        blockhash(block.number),
                        block.timestamp,
                        msg.sender,
                        _prizeNumber,
                        _totalTickets
                    )
                )
            ) % _totalTickets) + 1;
    }

    function withdrawETH(address to) external {
        if (msg.sender != deployer) revert NonDeployer();

        payable(to).transfer(address(this).balance);
    }

    function withdrawToken(address token, address to) external {
        if (msg.sender != deployer) revert NonDeployer();

        IERC20(token).transfer(to, IERC20(token).balanceOf(address(this)));
    }
}
