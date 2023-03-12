// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Kikuya is ERC20 {
    constructor() ERC20("Kikuya", "KKY") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
}
