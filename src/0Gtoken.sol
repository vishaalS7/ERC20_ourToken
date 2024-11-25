// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract OGToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "OG Token";
    }

    // instead of this above name function we can create state variable to reduce gas

    // string public s_name = "OG Token";

    function totalSupply() public pure returns (uint256) {
        return 100 ether; // 100,00000000000000000 100 x 100 ** 18
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
