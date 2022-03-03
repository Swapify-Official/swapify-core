pragma solidity =0.5.16;

import '../SwapifyERC20.sol';

contract ERC20 is SwapifyERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
