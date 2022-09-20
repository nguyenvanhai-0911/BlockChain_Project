import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { Signer } from "ethers";
import { ethers, upgrades, network } from "hardhat";

let [deployer, admin, user1, user2]: SignerWithAddress[] = [];

const deployContractYBNFT = async () => {
  const YBFac = await ethers.getContractFactory("YBNFT");
  const nftYB = await upgrades.deployProxy(YBFac, ["YB NFT", "YBNfts"]);

  await nftYB.deployed();

  console.log("Address YBNfts", nftYB.address);
}

const deployContractSadNFT = async () => {
  const sadFac = await ethers.getContractFactory("SadNFT");
  const sadNFTs = await sadFac.deploy();

  await sadNFTs.deployed();

  console.log("Address Contract SadNFT", sadNFTs.address);
  
}

async function main() {
  [deployer] = await ethers.getSigners();

  // await deployContractYBNFT();
  await deployContractSadNFT();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});