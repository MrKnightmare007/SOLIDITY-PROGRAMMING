// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionLogger {
    address public owner;
    
    // Mapping to store the balance of each user
    mapping(address => uint256) public balances;
    
    // Events as specified in the requirements
    event DepositMade(address indexed user, uint256 amount, uint256 timestamp);
    event WithdrawalMade(address indexed user, uint256 amount, uint256 timestamp);
    event OwnershipTransferred(address indexed oldOwner, address indexed newOwner, uint256 timestamp);
    
    // Constructor to set the deployer as the initial owner
    constructor() {
        owner = msg.sender;
    }
    
    // Modifier to restrict function access to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    // Function to deposit ETH and log the event
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        
        // Update the user's balance
        balances[msg.sender] += msg.value;
        
        // Emit the DepositMade event
        emit DepositMade(msg.sender, msg.value, block.timestamp);
    }
    
    // Function to withdraw ETH and log the event
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        // Update the user's balance
        balances[msg.sender] -= amount;
        
        // Transfer ETH to the user
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
        
        // Emit the WithdrawalMade event
        emit WithdrawalMade(msg.sender, amount, block.timestamp);
    }
    
    // Function to transfer ownership and log the event
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        require(newOwner != owner, "New owner cannot be the current owner");
        
        address oldOwner = owner;
        owner = newOwner;
        
        // Emit the OwnershipTransferred event
        emit OwnershipTransferred(oldOwner, newOwner, block.timestamp);
    }
    
    // Function to check the contract's balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    // Function to check a user's balance
    function getUserBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}