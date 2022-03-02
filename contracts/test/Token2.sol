pragma solidity =0.5.16;

import './ERC20Detailed.sol';
import './Token.sol';

contract Token2 is ERC20Detailed, Token {
    constructor() ERC20Detailed('Token 2', 'TOK2', 18) public {}

    /**
     * @dev this internal function mints token to given address
     */
    function mint(address to, uint value) external {
        require(value <= uint256(-1) - totalSupply(), "Token1: Total supply exceeded max limit.");
        require(value <= uint256(-1) - balanceOf(to), "Token1: Balance of minter exceeded max limit.");
        _mint(to, value);
    }
}