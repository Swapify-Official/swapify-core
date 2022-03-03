const SwapifyFactory = artifacts.require("SwapifyFactory.sol");
const InitHash = artifacts.require("InitHash.sol");
const SwapifyPair = artifacts.require("SwapifyPair.sol");

module.exports = async function(deployer, network, addresses) {
    await deployer.deploy(SwapifyFactory, addresses[0]);
    await SwapifyFactory.deployed();
    await deployer.deploy(InitHash);
    await InitHash.deployed();
    await deployer.deploy(SwapifyPair);
    await SwapifyPair.deployed();


};