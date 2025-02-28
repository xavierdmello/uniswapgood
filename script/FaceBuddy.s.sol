// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FaceBuddy} from "../src/FaceBuddy.sol";

contract FaceBuddyScript is Script {
    FaceBuddy public faceBuddy;
    address payable public router;
    address public poolManager;
    address public permit2;

    function setUp() public {
        router = payable(vm.envAddress("ROUTER_ADDRESS"));
        poolManager = vm.envAddress("POOL_MANAGER_ADDRESS");
        permit2 = vm.envAddress("PERMIT2_ADDRESS");
    }

    function run() public {
        vm.startBroadcast();

        faceBuddy = new FaceBuddy(router, poolManager, permit2);

        vm.stopBroadcast();
    }
}
