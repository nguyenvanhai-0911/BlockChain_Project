// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/utils/ERC721HolderUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol";

contract MyToken is ERC20Upgradeable, ERC721HolderUpgradeable, OwnableUpgradeable {
    IERC721Upgradeable public nft;

    mapping(uint256 => address) public tokenOwnerOf;
    mapping(uint256 => uint256) public tokenStakedAt;

    uint256 public EMISSION_RATE; 

    function initialize(address _nft) public initializer {
        __ERC20_init("MyToken", "HaiToken");
        nft = IERC721Upgradeable(_nft);
        EMISSION_RATE = (100 * 10**decimals()) / 1 days;
    }

    function stake(uint256 tokenId) external {
        nft.safeTransferFrom(msg.sender, address(this), tokenId);
        tokenOwnerOf[tokenId] = msg.sender;
        tokenStakedAt[tokenId] = block.timestamp;
    }

    function calculateTokens(uint256 tokenId) public view returns (uint256) {
        uint256 timeElapsed = block.timestamp - tokenStakedAt[tokenId];
        return timeElapsed * EMISSION_RATE;
    }

    function unStake(uint256 tokenId) external {
        require(tokenOwnerOf[tokenId] == msg.sender, "You can't unstake");
        _mint(msg.sender, calculateTokens(tokenId)); // mint token for stake nfts
        nft.transferFrom(address(this), msg.sender, tokenId);

        delete tokenOwnerOf[tokenId];
        delete tokenStakedAt[tokenId];
    }

}