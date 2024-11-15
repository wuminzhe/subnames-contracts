// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import "src/L1/L1Resolver.sol";

contract DeployL1Resolver is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddresss = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        /// L1 Resolver constructor data
        string memory url =
            "https://g2d.site/{sender}/{data}.json"; //
        address[] memory signers = new address[](1);
        signers[0] = 0x6Be02d1d3665660d22FF9624b7BE0551ee1Ac91b; // DEV signer
        address owner = deployerAddresss;
        address rootResolver = 0x8FADE66B79cC9f707aB26799354482EB93a5B7dD; //ringdao.eth root resolver on sepolia

        L1Resolver l1 = new L1Resolver(url, signers, owner, rootResolver);
        console.log(address(l1));

        vm.stopBroadcast();
    }
}
