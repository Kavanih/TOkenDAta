// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./IDEXRouter.sol";



interface IUniswapV2Pair {
    function getReserves() external view returns (uint reserveA, uint reserveB);
    function token0() external view returns (address);
    function token1() external view returns (address);
}


contract getIN{
    IDEXRouter public uniswapRouter;
    address public WETHAddress = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6; 
    address public USDTAddress = 0xfad6367E97217cC51b4cd838Cc086831f81d38C2; 

    
    constructor() {
    uniswapRouter = IDEXRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D); 
    }


    function getPairTokenAddresses(address lpTokenAddress) public view returns (address, address) {
        IUniswapV2Pair uniswapPair = IUniswapV2Pair(lpTokenAddress);
        address token0 = uniswapPair.token0();
        address token1 = uniswapPair.token1();

        return (token0, token1);
    }

    function getTokenInfo(address lpTokenAddress) public view returns (uint256 tokenPriceUSD, uint256 baseTokenPriceUSD, uint256 tokenMcap) {
        require(lpTokenAddress != address(0), "Invalid LP token address");

        IUniswapV2Pair uniswapPair = IUniswapV2Pair(lpTokenAddress);
        address token0 = uniswapPair.token0();
        address token1 = uniswapPair.token1();

        bool isWETHPair = (token0 == WETHAddress || token1 == WETHAddress);
        bool isUSDTPair = (token0 == USDTAddress || token1 == USDTAddress);

        require(isWETHPair || isUSDTPair, "LP token must be a WETH or USDT pair");

        address tokenAddress = (token0 == WETHAddress || token0 == USDTAddress) ? token1 : token0;
        address baseTokenAddress = isWETHPair ? WETHAddress : USDTAddress;

        address[] memory path = new address[](2);
        path[0] = tokenAddress;
        path[1] = baseTokenAddress;

        uint256[] memory amounts = uniswapRouter.getAmountsOut(1e18, path);
        baseTokenPriceUSD = amounts[1];

        IERC20 token = IERC20(tokenAddress);
        uint256 tokenDecimals = token.decimals();
        tokenPriceUSD = (amounts[1] * baseTokenPriceUSD) / (10 ** tokenDecimals);
        tokenMcap = tokenPriceUSD * token.totalSupply();
    }

    function calculateUSDValue(uint256 lockedAmount, address tokenAddress) public view returns (uint256) {
        (uint256 tokenPriceUSD,,) = getTokenInfo(tokenAddress); // Assuming this function returns the price per standard unit of token

        IERC20 token = IERC20(tokenAddress);
        uint256 tokenDecimals = token.decimals();

        uint256 standardUnitAmount = lockedAmount / (10 ** tokenDecimals);
        uint256 usdValue = standardUnitAmount * tokenPriceUSD;

        return usdValue;
    }


}