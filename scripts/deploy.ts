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

async function main() {
  [deployer] = await ethers.getSigners();

  await deployContractYBNFT();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});