// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InGame {
    string public name;
    string public symbol;
    address public owner;

    mapping(address => bool) private bandages;
    mapping(address => bool) private mediKit;
    mapping(address => bool) private arGuns;
    mapping(address => bool) private ingameEmote;
    mapping(address => uint256[4]) private redeemedItems;

    mapping(address => uint256) private balances;

    constructor() {
        name = "inGameTokens";
        symbol = "UC";
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function mint(address account, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        balances[account] += amount;
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
    }
    
    function showRedeemableItems() public pure returns (string memory) {
        return "1. bandages(100 AVAX)  2. mediKit(100 AVAX)  3. arGuns(30 AVAX)  4. ingameEmote(50 AVAX)";
    }

    function redeemToken(uint256 item, uint256 quantity) public {
        require(quantity > 0, "Quantity must be greater than zero");

        if (item == 1) {
            redeemTShirt(quantity);
        } else if (item == 2) {
            redeemmediKit(quantity);
        } else if (item == 3) {
            redeemarGuns(quantity);
        } else if (item == 4) {
            redeemingameEmote(quantity);
        } else {
            revert("Invalid item");
        }
    }

    function redeemTShirt(uint256 quantity) private {
        uint256 requiredBalance = 100 * quantity;
        require(balances[msg.sender] >= requiredBalance, "Insufficient balance for bandages redemption");
        require(!bandages[msg.sender], "bandages already redeemed");

        bandages[msg.sender] = true;
        balances[msg.sender] -= requiredBalance;
        redeemedItems[msg.sender][0] += quantity;
        // Add additional logic for granting the bandages item(s) to the player
    }

    function redeemmediKit(uint256 quantity) private {
        uint256 requiredBalance = 100 * quantity;
        require(balances[msg.sender] >= requiredBalance, "Insufficient balance for mediKit redemption");
        require(!mediKit[msg.sender], "mediKit already redeemed");

        mediKit[msg.sender] = true;
        balances[msg.sender] -= requiredBalance;
        redeemedItems[msg.sender][1] += quantity;
        // Add additional logic for granting the mediKit item(s) to the player
    }

    function redeemarGuns(uint256 quantity) private {
        uint256 requiredBalance = 30 * quantity;
        require(balances[msg.sender] >= requiredBalance, "Insufficient balance for arGuns redemption");
        require(!arGuns[msg.sender], "arGuns already redeemed");

        arGuns[msg.sender] = true;
        balances[msg.sender] -= requiredBalance;
        redeemedItems[msg.sender][2] += quantity;
        // Add additional logic for granting the arGuns item(s) to the player
    }

    function redeemingameEmote(uint256 quantity) private {
        uint256 requiredBalance = 50 * quantity;
        require(balances[msg.sender] >= requiredBalance, "Insufficient balance for ingameEmote redemption");
        require(!ingameEmote[msg.sender], "ingameEmote already redeemed");

        ingameEmote[msg.sender] = true;
        balances[msg.sender] -= requiredBalance;
        redeemedItems[msg.sender][3] += quantity;
        // Add additional logic for granting the ingameEmote item(s) to the player
    }

    function checkBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    function showRedeemedItems(address account) public view returns (string memory) {
        string[4] memory itemNames = ["bandages", "mediKit", "arGuns", "ingameEmote"];
        string memory result = "";

        for (uint256 i = 0; i < itemNames.length; i++) {
            if (i > 0) {
                result = string(abi.encodePacked(result, "\n"));
            }
            result = string(
                abi.encodePacked(result, itemNames[i], ": ", toString(redeemedItems[account][i]), " items")
            );
        }

        return result;
    }

    function toString(uint256 value) private pure returns (string memory) {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);

        for (uint256 i = digits; i > 0; i--) {
            buffer[i - 1] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }

        return string(buffer);
    }
}
