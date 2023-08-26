//require("@nomiclabs/hardhat-avalanche");

const { API_URL, PRIVATE_KEY } = process.env;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
    avalanche: {
      url: 'https://avax.getblock.io/aa321305-c477-4984-8cb8-a720d4327fff/mainnet/ext/bc/C/rpc',
      chainId: 43114, // Avalanche Fuji Testnet
      accounts: ['469118f2ce4262f230644bb1c2748adb59622272460d2d0a6b10aba8e56d066d'],
    },
  },
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
