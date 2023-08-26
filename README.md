# DegenGamingToken Smart Contract

## Introduction

This repository contains a Solidity smart contract for the DegenGamingToken, a token designed for gaming applications. The contract includes functionalities for token transfers, approvals, minting, burning, and token locking.

## Smart Contract Details

- **Name:** DegenGamingToken
- **Symbol:** DGN
- **Decimals:** 18
- **Total Supply:** Initially set during deployment
- **Owner:** The deployer of the contract

### Functionalities

1. **Transfer:** Allows users to transfer tokens to other addresses.
2. **Approve:** Allows users to approve another address to spend tokens on their behalf.
3. **TransferFrom:** Allows approved addresses to transfer tokens from the user's balance.
4. **Mint:** Only the contract owner can mint new tokens and increase the total supply.
5. **Burn:** Users can burn their own tokens, reducing the total supply.
6. **LockTokens:** Users can lock a specific amount of their tokens for a defined duration.
7. **UnlockTokens:** Users can unlock their locked tokens after the lock duration has passed.

### Events

The contract emits various events to notify external systems about its actions:

- `Transfer`: Emitted when tokens are transferred.
- `Approval`: Emitted when an approval for token spending is given.
- `Mint`: Emitted when new tokens are minted.
- `Burn`: Emitted when tokens are burned.
- `LockTokens`: Emitted when tokens are locked.
- `UnlockTokens`: Emitted when tokens are unlocked.

## Deployment

To deploy the DegenGamingToken contract, you can use the provided Hardhat script. Modify the `initialSupply` parameter in the script to set the desired initial supply for the token. Ensure you have your environment properly configured with the required environment variables.

Run the deployment script using the following command:

```bash
npx hardhat run deploy.js
```

## Hardhat Configuration

The repository also includes a Hardhat configuration file to facilitate deployment to the Avalanche network. Ensure you have the necessary dependencies installed and that you've configured the `API_URL` and `PRIVATE_KEY` environment variables.

Modify the network settings in the Hardhat configuration file as needed.

## License

This project is licensed under the MIT License. 

