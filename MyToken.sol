pragma solidity ^0.4.16;

    contract MyToken {
        event Transfer(address indexed from, address indexed to, uint256 value);
        /* This creates an array with all balances */
        mapping (address => uint256) public balanceOf;
        string public name;
        string public symbol;
        uint8 public decimals;
        
        constructor(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalUnits) public {
            balanceOf[msg.sender] = initialSupply;
            name = tokenName;
            symbol = tokenSymbol;
            decimals = decimalUnits;
            
        }
            /* Send Coins */    
        function transfer(address _to, uint256 _value) public {
            /* Check if sender has balance and for overflows */
            require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

            /* Add and subtract new balances */
            balanceOf[msg.sender] -= _value;
            balanceOf[_to] += _value;
            
            /* Notify anyone listening that this transfer took place */
            emit Transfer(msg.sender, _to, _value);
        }
    }
