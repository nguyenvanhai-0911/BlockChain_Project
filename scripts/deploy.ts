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

const deployContractMyNft = async () => {
    const MyNftFac = await ethers.getContractFactory("MyNfts");
    const myNfts = await upgrades.deployProxy(MyNftFac, ["My Token","Hai_NFT"]);

    await myNfts.deployed();
    console.log("Address MyNfts", myNfts.address);
}

const deployContractStakingToken = async () => {
  const MyTokenStakingFac = await ethers.getContractFactory("MyToken");
  const myTokenStaking = await upgrades.deployProxy(MyTokenStakingFac, 
                                                    [
                                                      "0x877467717a775C9504eCa8FBb99aD5cf88a82e3A"
                                                    ]);
  
  await myTokenStaking.deployed();
  console.log("Address My Token Staking", myTokenStaking.address);
}

async function main() {
  [deployer] = await ethers.getSigners();

  // await deployContractYBNFT();
  // await deployContractSadNFT();
  // await deployContractMyNft();
  await deployContractStakingToken();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});