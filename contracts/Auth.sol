pragma solidity >=0.4.22 <0.9.0;

// Dependencies
import "@openzeppelin/contracts/access/AccessControl.sol";

/**
    @title Administration Contract
    @author RossK
    @notice Implements roles.
 */
contract Auth is AccessControl {
    bytes32 public constant USER_ROLE = keccak256("USER");

    // Add deployer address to admin role.
    constructor (address deployer) {
        _setupRole(DEFAULT_ADMIN_ROLE, deployer);
        _setRoleAdmin(USER_ROLE, DEFAULT_ADMIN_ROLE);
    }

    // Restricted to members of admin role.
    modifier OnlyAdmin() {
        require(CheckAdmin(msg.sender), "This is resricted to administrators");
        _;
    }

    // Will return true if the address belongs to the admin role.
    function CheckAdmin(address account) public virtual view returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, account);
    }

    // Add administrator to another address. Restricted to admins.
    function AddAdmin(address account) public virtual OnlyAdmin {
        grantRole(DEFAULT_ADMIN_ROLE, account);
    }

    // Remove administrator from another address. Restricted to admins. (Basically remove admin)
    function AddUser(address account) public virtual OnlyAdmin {
        grantRole(USER_ROLE, account);
    }

    // Remove admin from your address.
    function SurrenderAdmin() public virtual {
        renounceRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
}