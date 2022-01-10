pragma solidity >=0.4.22 <0.9.0;

// Dependencies
import "@openzeppelin/contracts/utils/math/Math.sol";

// Interface setup
interface ERCItem {
  function mint(address account, uint256 amount) external;
  function burn(address account, uint256 amount) external;
  function balance(address account) external returns (uint256);

  function stake(address account, uint256 amount) external;
  function getStakedAmount(address account) external returns (uint256);
}

contract PlayerWorld {
  constructor() public {
  }
}
