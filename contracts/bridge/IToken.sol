// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.9;

interface IToken {
  function mint(address to, uint amount) external;
  function burn(address owner, uint amount) external;
}
