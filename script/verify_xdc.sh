
# GoodDollarExchangeProvider impl
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $EXCHANGEPROVIDER_IMPL GoodDollarExchangeProvider --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
# forge verify-contract --chain $CHAIN_ID --verifier sourcify $EXCHANGEPROVIDER_IMPL GoodDollarExchangeProvider --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1

# # # GoodDollarExpansionController impl 
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $EXPANSIONCONTROLLER_IMPL GoodDollarExpansionController --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify $EXPANSIONCONTROLLER_IMPL GoodDollarExpansionController --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1

# # #registry impl
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $REGISTRY_IMPL Registry --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify $REGISTRY_IMPL Reserve --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1

# #reserve impl
forge verify-contract --verbosity -vvvvv --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $RESERVE_IMPL Reserve --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1 --watch --evm-version istanbul --compiler-version v0.5.17 -vvvvv
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify $RESERVE_IMPL Reserve --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1

# # # broker impl
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $BROKER_IMPL Broker --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify $BROKER_IMPL Broker --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1

# # # proxy admin
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  0x54f44fBE2943c2196D94831288E716cdeAF56579 ProxyAdmin -optimizer-runs 200 --retries 1 --compiler-version 0.8.18
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify 0x8855a8e5b6717FE834ce673D110Bcf4f52B03aea ProxyAdmin --optimizer-runs 200 --retries 1 --compiler-version 0.8.18

# # # this will verify all transparentupgradeable proxies
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  0x34f260FcCe222afF0DA07ED12E239af38A144682 TransparentUpgradeableProxy --optimizer-runs 200 --retries 1 --compiler-version 0.8.18 --constructor-args 000000000000000000000000fb1cf4e85d82c4c90e33e5173d26ce558cb9de8e0000000000000000000000008855a8e5b6717fe834ce673d110bcf4f52b03aea00000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000
# forge verify-contract --chain $CHAIN_ID --verifier sourcify 0x558ec7e55855fac9403de3adb3aa1e588234a92c TransparentUpgradeableProxy --optimizer-runs 200 --retries 1 --compiler-version 0.8.18 --constructor-args 000000000000000000000000fb1cf4e85d82c4c90e33e5173d26ce558cb9de8e0000000000000000000000008855a8e5b6717fe834ce673d110bcf4f52b03aea00000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000

# # # broker latest impl
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $BROKER_IMPL_LATEST Broker --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify $BROKER_IMPL_LATEST Broker --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1

# # # exchange latest impl
# forge verify-contract --verifier etherscan --verifier-url https://api.etherscan.io/v2/api?chainid=$CHAIN_ID --etherscan-api-key $ETHERSCAN_KEY  $EXCHANGEPROVIDER_IMPL_LATEST GoodDollarExchangeProvider --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
# forge verify-contract  --chain $CHAIN_ID --verifier sourcify $EXCHANGEPROVIDER_IMPL_LATEST Broker --constructor-args 0000000000000000000000000000000000000000000000000000000000000000 --optimizer-runs 200 --retries 1
