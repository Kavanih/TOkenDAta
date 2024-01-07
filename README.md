# Readme for `getIN` Solidity Contract

## Introduction
Hi there! I'm Kavaniih Moh`d, and I'm excited to share with you a Solidity smart contract I've developed called `getIN`. This contract is designed to interact with the Uniswap V2 protocol on the Ethereum blockchain. It's a great resource for newbies and anyone looking to understand how to fetch token information and calculate token values in USD. The contract is straightforward, making it an excellent tool for learning and experimentation.

## Features
The `getIN` contract includes several key features:
1. **Uniswap Router Integration**: Interacts with the Uniswap V2 Router to fetch token prices.
2. **Token Pair Addresses**: Retrieves the addresses of tokens in a Uniswap liquidity pair.
3. **Token Information**: Provides detailed information about a given token, including its USD price and market capitalization.
4. **USD Value Calculation**: Calculates the USD value of a specific amount of a token.

## How to Use
To use the `getIN` contract, follow these steps:
1. **Deploy the Contract**: Deploy the contract on the Ethereum blockchain using a development environment like Remix, Truffle, or Hardhat.
2. **Set Up Uniswap Router**: Ensure the Uniswap Router address is correctly set in the constructor for the network you're using.
3. **Interact with Functions**:
    - `getPairTokenAddresses(address lpTokenAddress)`: Pass a Uniswap liquidity pool token address to get the addresses of the two tokens in the pair.
    - `getTokenInfo(address lpTokenAddress)`: Pass a Uniswap liquidity pool token address to get information about one of the tokens in the pair, including its price in USD.
    - `calculateUSDValue(uint256 lockedAmount, address tokenAddress)`: Pass the amount of a token and its address to calculate its value in USD.

## Important Notes
- **Network Compatibility**: The contract is set up for the Ethereum Mainnet. For other networks, adjust the Uniswap Router address accordingly.
- **Decimal Handling**: Token values are handled in their smallest unit (like wei for ETH). The contract adjusts for token decimals in calculations.

## Disclaimer
This contract is for educational purposes. While it has been carefully written, always ensure to test thoroughly and understand the underlying mechanisms before using it in a production environment.

## Contribute
Feel free to contribute to this project! Any improvements, bug fixes, or enhancements are welcome. You can submit pull requests or raise issues on this GitHub repository.

---

I hope this contract helps you on your journey to understanding blockchain technology and smart contract development. Happy coding!

- Kavaniih Moh`d

