import * as dotenv from "dotenv";

import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";
import "hardhat-tracer";
import "@openzeppelin/hardhat-upgrades";

dotenv.config();

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.9",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.6.12",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  networks: {
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/7z572lXXuyfpl4wcS-faR81Oyobzb8Pj",
      accounts: [
        process.env.PRIVATE_KEY_DEPLOYER!,
        process.env.PRIVATE_KEY_ADMIN!,
        process.env.PRIVATE_KEY_USER1!,
        process.env.PRIVATE_KEY_USER2!,
      ],
    },
    bsc_testnet: {
      chainId: 97,
      url: "https://bsc-testnet.nodereal.io/v1/a1bdda211c0342bfa21bccfee5368c80",
      accounts: [
        process.env.PRIVATE_KEY_DEPLOYER!,
        process.env.PRIVATE_KEY_ADMIN!,
        process.env.PRIVATE_KEY_USER1!,
        process.env.PRIVATE_KEY_USER2!,
      ],
    },
  },
  gasReporter: {
    enabled: true,
    currency: "USD",
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://bscscan.com/
    // apiKey: 'H73WJKKZ7PP5WGF9C11EAPU8MJKY9BNHIJ',
    // apiKey: '4FIZ8WRNU47K26M8DG3YG5ZWR29V7EKAGY',
    // apiKey: 'VWUW5SH2YZXQ2G1XSRHHFMWPBX9SEZ6SZK',
    apiKey: process.env.BSCSCAN_APIKEY
  },
};

export default config;