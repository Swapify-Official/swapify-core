pragma solidity =0.5.16;

import './interfaces/ISwapifyPair.sol';
import './SwapifyPair.sol';

contract InitHash {

    function getInitHash() public pure returns(bytes32){
        bytes memory bytecode = type(SwapifyPair).creationCode;
        return keccak256(abi.encodePacked(bytecode));
    }

    function getAddress(address factory, address tokenA, address tokenB) external pure returns(address) {
         (address token0,) = sortTokens(tokenA, tokenB);
         return pairFor(factory, tokenA, tokenB);
    }
    // returns sorted token addresses, used to handle return values from pairs sorted in this order
    function sortTokens(address tokenA, address tokenB) internal pure returns (address token0, address token1) {
        require(tokenA != tokenB, 'SwapifyLibrary: IDENTICAL_ADDRESSES');
        (token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'SwapifyLibrary: ZERO_ADDRESS');
    }

    // calculates the CREATE2 address for a pair without making any external calls
    function pairFor(address factory, address tokenA, address tokenB) internal pure returns (address pair) {
        (address token0, address token1) = sortTokens(tokenA, tokenB);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'5e977d2a29b161d57782c804568e7d22f9091ec07fb0da3dd9d50fa2595a9784' // init code hash
            ))));
    }

    // fetches and sorts the reserves for a pair
    function getReserves(address factory, address tokenA, address tokenB)  external view returns (uint reserveA, uint reserveB) {
        (address token0,) = sortTokens(tokenA, tokenB);
        (uint reserve0, uint reserve1,) = ISwapifyPair(pairFor(factory, tokenA, tokenB)).getReserves();
        (reserveA, reserveB) = tokenA == token0 ? (reserve0, reserve1) : (reserve1, reserve0);
    }
}
