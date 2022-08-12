// SPDX-License-Identifier: UNLICENSED 
pragma solidity  ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol";

contract FaucetToken is ERC20 {
    uint256 private _cap = 1000000000e18;

    constructor(string memory _name, string memory _symbol)
        ERC20(_name, _symbol)
    {}

    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }

    function burn(address _to, uint256 _amount) public {
        _burn(_to, _amount);
    }
}

contract ERC20Token is ERC20, Ownable {
    uint256 private _cap = 1000000000 * decimals();

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        _mint(msg.sender, _cap);
    }

    function mint(address to, uint256 amount) public onlyOwner{
        _mint(to, amount);
    }

    function burn(address to, uint256 amount) public onlyOwner{
        _burn(to, amount);
    }
}
