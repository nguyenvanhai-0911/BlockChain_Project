// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import './TokenBase.sol';

contract TokenBsc is TokenBase {
  constructor() TokenBase('BSC Token', 'BTK') {}
}
