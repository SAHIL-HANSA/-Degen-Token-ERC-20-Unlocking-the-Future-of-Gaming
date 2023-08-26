// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegenGamingToken {
    string public name = "Degan";
    string public symbol = "DGN";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    struct Lock {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => Lock) public locks;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
    event LockTokens(address indexed from, uint256 amount, uint256 unlockTime);
    event UnlockTokens(address indexed from, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10**uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0), "Invalid recipient address");
        require(value <= balanceOf[msg.sender], "Insufficient balance");
        
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(to != address(0), "Invalid recipient address");
        require(value <= balanceOf[from], "Insufficient balance");
        require(value <= allowance[from][msg.sender], "Allowance exceeded");
        
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        
        emit Transfer(from, to, value);
        return true;
    }

    function mint(address to, uint256 value) external onlyOwner {
        require(to != address(0), "Invalid recipient address");
        
        balanceOf[to] += value;
        totalSupply += value;
        
        emit Mint(to, value);
    }

    function burn(uint256 value) external {
        require(value <= balanceOf[msg.sender], "Insufficient balance");
        
        balanceOf[msg.sender] -= value;
        totalSupply -= value;
        
        emit Burn(msg.sender, value);
    }

    function lockTokens(uint256 amount, uint256 lockDuration) external {
        require(amount <= balanceOf[msg.sender], "Insufficient balance");
        require(amount > 0, "Amount must be greater than zero");
        
        uint256 unlockTime = block.timestamp + lockDuration;
        
        balanceOf[msg.sender] -= amount;
        locks[msg.sender] = Lock(amount, unlockTime);
        
        emit LockTokens(msg.sender, amount, unlockTime);

    }

    function unlockTokens() external {
        Lock memory playerLock = locks[msg.sender];
        require(playerLock.amount > 0, "No locked tokens found");
        require(block.timestamp >= playerLock.unlockTime, "Tokens are still locked");

        balanceOf[msg.sender] += playerLock.amount;
        emit UnlockTokens(msg.sender, playerLock.amount);

        delete locks[msg.sender];
    }

}