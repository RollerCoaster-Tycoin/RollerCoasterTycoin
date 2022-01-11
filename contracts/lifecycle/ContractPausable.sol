pragma solidity >=0.4.22 <0.9.0;

// Dependencies
import "../Auth.sol";

/**
    @title Contract Pausing Contract
    @author RossK
    @notice Allows administrators to pause.
 */
abstract contract ContractPausable is Auth {

    bool public Paused = false;

    modifier IfNotPaused() {
        require(!Paused);
        _;
    }

    modifier IfPaused() {
        require(Paused);
        _;
    }

    function PauseContract() external OnlyAdmin IfNotPaused {
        Paused = true;
    }

    function UnPauseContract() public OnlyAdmin IfPaused {
        Paused = false;
    }
}
