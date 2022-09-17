// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/interfaces/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";

contract YBNFT is ERC721Upgradeable, OwnableUpgradeable {
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.UintSet;
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.AddressSet;

    EnumerableSetUpgradeable.AddressSet private _admins;

    uint256 private _minPriceAddListing;
    uint256 public nextTokenId;
    string public baseURI;

    modifier onlyAdmin() {
        require(_admins.contains(_msgSender()), "Not admin");
        _;
    }

    function initialize(string memory _name, string memory _symbol)
        public
        initializer
    {
        __ERC721_init_unchained(_name, _symbol);
        __Ownable_init();

        _admins.add(msg.sender);

        nextTokenId = 1;
    }

    function addAdmin(address value) external onlyOwner {
        _admins.add(value);
    }

    function setBaseURI(string memory __baseURI) external onlyOwner {
        baseURI = __baseURI;
    }

    // function _baseURI() internal view override returns (string memory) {
    //     return Strings.strConcat(
    //         _baseURI()
    //     )
    // }

    function setMinPriceAddListing(uint256 value) external onlyOwner {
        _minPriceAddListing = value;
    }

    function safeMint(address minter) external onlyAdmin returns (uint256) {
        uint256 id = nextTokenId;
        _safeMint(minter, id);
        nextTokenId++;

        return id;
    }

    function mintBatchAdmin(address minter, uint256 amount) external onlyOwner {
        for (uint256 i = 0; i < amount; i++) {
            uint256 tokenId = nextTokenId;
            _safeMint(minter, tokenId);
            nextTokenId++;
        }
    }

    function burn(uint256 tokenId) external onlyAdmin {
        _burn(tokenId);
    }

    function transferToken(IERC20Upgradeable token, uint256 amount, address to) external onlyOwner {
        if(address(token) == address(0)) {
            payable(to).call{value: amount}("");
        } else {
            require(token.balanceOf(address(this)) >= amount, "Not enough balance");
            token.transfer(to, amount);
        }
    }
}