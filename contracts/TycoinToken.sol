pragma solidity >=0.4.22 <0.9.0;

// Dependencies
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/**
    @title Token Contract
    @author RossK
    @notice Sets up our ecosystem token.
 */
contract TycoinToken is ERC20, ERC20Burnable {
  address public Minter;
  address private Owner;

  event MinterChanged(address indexed FromPrevious, address ToNew);

  constructor() payable ERC20("RollerCoaster Tycoin", "RCT") {
    Owner = msg.sender;
  }

  function MintToken(address account, uint256 amount) public {
    require(Minter == address(0) || msg.sender == Minter, "You are not the token minter!");
    _mint(account, amount);
  }

  // This needs to be improved..
  // Change minter, transfer, get token owner, burn.

}
