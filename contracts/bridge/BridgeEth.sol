// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import './BridgeBase.sol';

contract BridgeEth is BridgeBase {
  constructor(address token) BridgeBase(token) {}
}
