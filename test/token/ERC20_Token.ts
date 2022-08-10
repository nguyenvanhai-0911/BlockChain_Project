import { ethers } from "hardhat";
import {Signer} from "ethers";
import {expect} from "chai";
import {FaucetToken} from "../../typechain-types/contracts/token/ERC20_Token.sol/FaucetToken";

let signers: Signer[];
let deployer: Signer;
let users: string[]= [];

let yb_token: FaucetToken; 

const setupAccount = async() => {
    signers = await ethers.getSigners();
    [deployer] = signers.slice(signers.length - 1);
    for(let i = 0; i < 5; i++){
        users[i] = await signers[i].getAddress();
    }
}

describe("ERC20_Token", function(){
    this.beforeAll(async() => {
        await setupAccount();
        const TokenFac = await ethers.getContractFactory("FaucetToken");
        yb_token = (await TokenFac.connect(deployer).deploy("YB Token", "YB")) as FaucetToken;
    })

    it("Mint YB Token", async() => {
        await yb_token.mint(users[1], 10000);
        await yb_token.mint(users[2], 50000);

        expect(await yb_token.balanceOf(users[1])).to.equal(10000);
        expect(await yb_token.balanceOf(users[2])).to.equal(50000);
    })
    

})