
pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";

// address public UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
// address public arvAddress = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984; // currently UNI token
// address public wethAddress = 0xc778417E063141139Fce010982780140Aa0cD5Ab;
// address public usdcAddress = 0xc7AD46e0b8a400Bb3C915120d284AafbA8fc4735; // currently DAI
contract ARVRouter {
    address public UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public arvAddress = 0x28fDA76721a8077A5dE802Ab0212849B8c38429E;
    address public wethAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public usdcAddress = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48; // currently DAI

    function arvPrice() public view returns (uint256) {
        IUniswapV2Router02 uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
        // address[] memory path = [wethAddress,arvAddress];
        address[] memory path1 = new address[](2);
        path1[0] = arvAddress;
        path1[1] = wethAddress;

        address[] memory path2 = new address[](2);
        path2[0] = wethAddress;
        path2[1] = usdcAddress;

        uint256 arvETH = uniswapRouter.getAmountsOut(1*(10**18), path1)[1];
        uint256 ethUSDC = uniswapRouter.getAmountsOut(1*(10**18), path2)[1];
        uint256 arvPrice = (arvETH * ethUSDC);// / (10**24.0);
        return arvPrice;
    }
}
