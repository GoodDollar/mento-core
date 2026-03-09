// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "forge-std/Script.sol";
import { TransparentUpgradeableProxy } from "openzeppelin-contracts-next/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "openzeppelin-contracts-next/contracts/proxy/transparent/ProxyAdmin.sol";

import { GoodDollarExchangeProvider } from "contracts/goodDollar/GoodDollarExchangeProvider.sol";
import { GoodDollarExpansionController } from "contracts/goodDollar/GoodDollarExpansionController.sol";
// import { Reserve } from "contracts/swap/Reserve.sol";
// import { Registry } from "contracts/import.sol";
import { Broker } from "contracts/swap/Broker.sol";
import { IReserve } from "contracts/interfaces/IReserve.sol";
import { ITradingLimits } from "contracts/interfaces/ITradingLimits.sol";
import { IERC20 } from "contracts/interfaces/IERC20.sol";

// import { BrokerProxy } from "contracts/swap/BrokerProxy.sol";

contract DeployGoodDollarImplementationsUpgrade is Script {
  // Deployment addresses to be populated
  GoodDollarExchangeProvider public exchangeProvider;
  Broker public broker;

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  string env = vm.envString("IMPL_ENV");
  address signer = vm.addr(deployerPrivateKey);
  address c2Deployer = 0x4e59b44847b379578588920cA78FbF26c0B4956C;

  function run() public {
    vm.startBroadcast(deployerPrivateKey);
    console.log("Deployer:", signer);

    // Deploy implementation contracts
    exchangeProvider = new GoodDollarExchangeProvider{
      salt: keccak256(abi.encodePacked("ExchangeProviderImplV2", env))
    }(true);

    broker = new Broker{ salt: keccak256(abi.encodePacked("MentoBrokerImplV2", env)) }(false);
    console.log("deployed broker");
    vm.stopBroadcast();

    // Log deployed addresses
    console.log("GoodDollarExchangeProvider deployed to:", address(exchangeProvider));
    console.log("Broker deployed to:", address(broker));
  }
}
