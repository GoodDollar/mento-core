// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "forge-std/Script.sol";
import { TransparentUpgradeableProxy, ITransparentUpgradeableProxy } from "openzeppelin-contracts-next/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "openzeppelin-contracts-next/contracts/proxy/transparent/ProxyAdmin.sol";
import { Ownable } from "openzeppelin-contracts-next/contracts/access/Ownable.sol";

import { GoodDollarExchangeProvider } from "contracts/goodDollar/GoodDollarExchangeProvider.sol";
import { GoodDollarExpansionController } from "contracts/goodDollar/GoodDollarExpansionController.sol";
import { IRegistry } from "contracts/goodDollar/interfaces/IRegistry.sol";
import { Broker } from "contracts/swap/Broker.sol";
import { IReserve } from "contracts/interfaces/IReserve.sol";
import { ITradingLimits } from "contracts/interfaces/ITradingLimits.sol";
import { IBancorExchangeProvider } from "contracts/interfaces/IBancorExchangeProvider.sol";
import { IERC20 } from "contracts/interfaces/IERC20.sol";

/**
 * We need to deploy proxy admin with nonce 429 of 0x512
 */
contract DeployProxyAdmin is Script {
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  string env = vm.envString("ENV");

  // Deployment addresses to be populated
  ProxyAdmin public proxyAdmin;

  address signer = vm.addr(deployerPrivateKey);
  address addressWithCode = vm.envAddress("AVATAR");

  function run() public {
    vm.startBroadcast(deployerPrivateKey);

    // proxyadmin needs to be deployed with nonce 429 from 0x512 to get same addresses
    if (keccak256(bytes(env)) == keccak256(bytes("PROD"))) {
      for (uint i = vm.getNonce(signer); i < 429; i++) {
        // console.log("nonce:", i);
        addressWithCode.call{ value: 0 }("");
      }
    } else {
      vm.setNonce(signer, 429);
    }
    // Deploy ProxyAdmin
    proxyAdmin = new ProxyAdmin();
    console.log("Proxy deployed to:", address(proxyAdmin));
    require(address(proxyAdmin) == 0x8471406C3Bff67Cc6538481C8550364bda6Ca691, "deployed to wrong address");

    vm.stopBroadcast();

    // Log deployed addresses
    console.log("Deployer:", signer);
    console.log("ProxyAdmin deployed to:", address(proxyAdmin));
  }
}
