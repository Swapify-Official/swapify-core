# Swapify-Core

# Deployment Instruction
1 Deploy Swapify-core contracts
2 Deploy Swapify-lottery contracts
3 Update the Init Code Hash in the file in Swapify-periphery/libraries/SwapifyLibrary so that it matches the Factory Init Code Hash
4 Deploy Swapify-periphery contracts
5 Deploy Swapify-dex contracts (You'll need factory, router, weth, and lottery contracts depoyed first)
6 Add permit mint for Lottery contracts to allow Router and DEX.  
7 Deploy Swapify-farm contracts
8 Make sure the SwapifyToken contract permits mint for the Masterchef contract

# Local Development

The following assumes the use of `node@>=10`.

## Install Dependencies

`yarn`

## Compile Contracts

`yarn compile`

## Run Tests

`yarn test`
