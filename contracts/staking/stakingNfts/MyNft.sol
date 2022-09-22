// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyNfts is ERC721Upgradeable, OwnableUpgradeable {
    uint256 public totalSupply;
    uint256 public nextTokenId;

    function initialize(string memory _name, string memory _symbol) public initializer {
        __ERC721_init(_name, _symbol);
        __Ownable_init();

        totalSupply = 10000;
        nextTokenId = 1;
    }

    function mintNft(address user) external onlyOwner returns (uint256) {
        uint256 id = nextTokenId;
        _safeMint(user, id);

        nextTokenId++;
        return id;
    }
}
