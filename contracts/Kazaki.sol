// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Kazaki {
    


    string public constant name = "Gesoikuo";
    string public constant symbol = "GIO";
    uint8 public constant decimals = 2;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    uint256 _totalSupply;

    constructor(uint256 total) {
      console.log("owner addr:", msg.sender);
      _totalSupply = total;
      balances[msg.sender] = _totalSupply;
    }
    
    // function name() public view returns (string) {
    //     return "Gesoikuo";
    // }
    
    // function symbol() public view returns (string) {
    //     return "GSI";
    // }
    
    // function decimals() public view returns (uint8) {
    //     return 18;
    // }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balances[_from] >= _value);
        require(allowed[_from][msg.sender] >= _value);
        balances[_from] -= _value;
        balances[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        return true;
        
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    
}