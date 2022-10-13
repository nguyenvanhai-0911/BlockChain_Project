// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract SadNFT is ERC721, Ownable {
    using Counters for Counters.Counter;

    // Constants
    uint256 public constant TOTAL_SUPPLY = 10_000;
    uint256 public constant MINT_PRICE = 0.0001 ether;

    Counters.Counter private currentTokenId;

    /// @dev Base token URI used as a prefix by tokenURI().
    string public baseTokenURI;

    constructor() ERC721("Sad NFT", "SADNFT") {
        baseTokenURI = "";
    }

    function mintTo(address recipient) public payable returns (uint256) {
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");

        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }

    /// @dev Returns an URI for a given token ID
    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    /// @dev Sets the base token URI prefix.
    function setBaseTokenURI(string memory _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    function transferToken(IERC20 token, uint256 amount, address to) external onlyOwner {
        if(address(token) == address(0)) {
            payable(to).call{value: amount}("");
        } else {
            require(token.balanceOf(address(this)) >= amount, "Not enough balance");
            token.transfer(to, amount);
        }
    }

     function transferAllToken(IERC20 token, address to) external payable onlyOwner {
        if(address(token) == address(0)) {
            payable(to).call{value: msg.value}("");
        } else {
            require(token.balanceOf(address(this)) >= msg.value, "Not enough balance");
            token.transfer(to, msg.value);
        }
    }
}