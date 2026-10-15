// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title Token
/// @notice Fixed-supply ERC20. The entire supply is minted once to the deployer
///         in the constructor. There is no mint function, no owner, no burn,
///         and no fees, so supply can never increase after deployment.
contract Token is ERC20 {
    error ZeroSupply();

    /// @param name_ Token name (e.g. "My Token")
    /// @param symbol_ Token symbol (e.g. "MTK")
    /// @param initialSupply Total supply in WHOLE tokens (scaled by 10**decimals())
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialSupply
    ) ERC20(name_, symbol_) {
        if (initialSupply == 0) revert ZeroSupply();
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }
}