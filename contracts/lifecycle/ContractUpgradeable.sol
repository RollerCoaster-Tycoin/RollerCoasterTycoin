pragma solidity >=0.4.22 <0.9.0;

// Dependencies
import "./ContractPausable.sol";

/**
    @title Contract Upgrading Contract
    @author RossK
    @notice Allows administrators to upgrade existing contracts if paused.
 */
abstract contract ContractUpgradeable is ContractPausable {
  
  address public NewContractAddress;

  event ContractUpgraded(address NewAddress);

  function SetNewContractAddress(address NewAddress) external OnlyAdmin IfPaused {
    NewContractAddress = NewAddress;
    emit ContractUpgraded(NewAddress);
  }

  function UnPauseContract() public override OnlyAdmin IfPaused {
    require(NewContractAddress == address(0));
    super.UnPauseContract();
  }
}
