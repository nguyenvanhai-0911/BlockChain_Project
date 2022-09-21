// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/interfaces/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";

contract MysteryBox is ERC1155SupplyUpgradeable, OwnableUpgradeable {
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.AddressSet;

    EnumerableSetUpgradeable.AddressSet private _admins;

    mapping(uint256 => uint256) public minPriceAddListing;
    mapping(uint256 => uint256) public caps;
    mapping(uint256 => uint256) public amountMinted;
    
    modifier onlyAdmin() {
        require(_admins.contains(_msgSender()), "Not Admin");
        _;
    }

    function getAdmin() public view returns(address[] memory) {
        return _admins.values();
    }

    function initialize(string memory _uri) public initializer {
        __ERC1155_init_unchained(_uri);
        __ERC1155Supply_init_unchained();
        __Ownable_init();

        _admins.add(msg.sender);

        caps[0] = 5000;

        minPriceAddListing[0] = 0.25 ether;
    }

    function _beforeTokenTransfer(
        address operator, 
        address from, 
        address to, 
        uint256[] memory ids, 
        uint256[] memory amounts, 
        bytes memory data
    ) internal virtual override {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);

        if(from == address(0)) {
            for(uint256 i = 0; i < ids.length; ++i) {
                amountMinted[ids[i]] += amounts[i];
                require(amountMinted[ids[i]] <= caps[ids[i]], "Exceed caps");
            }
        }
    }

    function addAdmin(address value) external onlyOwner {
        _admins.add(value);
    }

    function uri(uint256 _id) public view virtual override returns(string memory) {
        return Strings.strConcat(uri(_id), Strings.toString(_id));
    }

    function getMinPriceAddListing(uint256 rarity) external view returns(uint256) {
        return minPriceAddListing[rarity];
    }

    function setMinPriceAddListing(uint256 rarity, uint256 value) external onlyOwner {
        minPriceAddListing[rarity] = value;
    }

    function setCap(uint256 rarity, uint256 value) external onlyOwner {
        caps[rarity] = value;
    }

    function mint(address user, uint256 rarity, uint256 amount) external onlyAdmin {
        _mint(user, rarity, amount, "");
    }

    function burn(address user, uint256 rarity, uint256 amount) external onlyAdmin {
        _burn(user, rarity, amount);
    }

    function transferToken(IERC20Upgradeable token, uint256 amount, address to) external onlyAdmin {
        if(address(token) == address(0)) {
            payable(to).call{value: amount}("");
        } else {
            require(token.balanceOf(address(this)) >= amount, "Not enough balance");
            token.transfer(to, amount);
        }
    }
}
