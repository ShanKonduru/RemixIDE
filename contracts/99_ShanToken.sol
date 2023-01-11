pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ShanToken is IERC20 {
    // The address that will be able to mint new tokens
    address private _mintingAgent;

    // The total number of tokens in existence
    uint256 private _totalSupply;

    // A mapping from addresses to their token balance
    mapping(address => uint256) private _balances;

    // A mapping from addresses to the approved spenders of their tokens
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor() {
        _mintingAgent = msg.sender;
        _totalSupply = 0;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view  override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public  override returns (bool) {
        require(_balances[msg.sender] >= amount, "Not enough tokens");
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(_balances[sender] >= amount, "Not enough tokens");
        require(_allowances[sender][msg.sender] >= amount, "Not enough approved tokens");
        _balances[sender] -= amount;
        _allowances[sender][msg.sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function mint(address recipient, uint256 amount) public {
        require(msg.sender == _mintingAgent, "Only the minting agent can mint new tokens");
        _totalSupply += amount;
        _balances[recipient] += amount;
        emit Transfer(_mintingAgent, recipient, amount);
    }
}
