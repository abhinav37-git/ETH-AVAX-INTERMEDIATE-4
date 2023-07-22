# ETH-AVAX-INTERMEDIATE-4
InGame Contract

License This contract is using the MIT License.

Prerequisites Solidity ^0.8.0

>Challenge:
The task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:

Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

>Explanation:

The code is a Solidity smart contract named "InGame".

The contract defines several state variables:
name and symbol are public strings representing the name and symbol of the in-game tokens.
owner is the address of the contract owner.
balances is a mapping that stores the balance of each address.
The constructor function is executed once when the contract is deployed. It sets the initial values for name, symbol, and owner.
The onlyOwner modifier is defined to restrict certain functions to be called only by the contract owner. It throws an error if the caller is not the owner.
The mint function allows the contract owner to mint new tokens and assign them to a specified address. It requires the amount to be greater than zero.
The transfer function allows a user to transfer tokens to another address. It requires the amount to be greater than zero and the sender to have sufficient balance.
The burn function allows a user to burn (destroy) tokens from their own balance. It requires the amount to be greater than zero and the sender to have sufficient balance.
The showRedeemableItems function returns a string listing the redeemable items and their prices.
The redeemToken function allows a user to redeem a specific item by providing its index and quantity. It requires the quantity to be greater than zero. The function then calls the corresponding private redeem function based on the item index.
The private redeem functions (redeemTShirt, redeemmediKit, redeemarGuns, redeemingameEmote) are responsible for handling the redemption of specific items. They check the user's balance and make sure the item has not been redeemed before. If the conditions are met, the item is marked as redeemed, the user's balance is reduced, and the redeemed item count is incremented.
The checkBalance function returns the balance of a specified address.
The showRedeemedItems function returns a string listing the redeemed items and their quantities for a specified address. It uses the toString function to convert the quantities from uint256 to string.
The toString function is a private helper function that converts a uint256 value to a string.

https://www.loom.com/share/5b0a76121bd543c8a92bce58e95b26a7
