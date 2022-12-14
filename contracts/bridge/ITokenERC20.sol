// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.9;

interface ITokenERC20 {
  function mint(address to, uint amount) external;
  function burn(address owner, uint amount) external;
}
