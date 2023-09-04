# ETH-AVAX-INTERMEDIATE-4
Degen Contract

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
The Solidity contract named GameAsset. This contract represents an in-game asset and contains several functionalities such as creating, transferring, and destroying assets, redeeming items, and checking the balance of an account.
State variables: These are variables declared at the contract level. They include assetName, assetSymbol, assetOwner, hasItem1, hasItem2, hasItem3, hasItem4, redeemedItems, and balances. These variables are permanently stored in the Ethereum blockchain and represent the "state" of the contract.
Constructor: This is a special function that is executed when the contract is deployed. It sets the initial state of the contract, including the name, symbol, and owner of the asset.
Modifiers: The onlyOwner modifier is used to restrict access to certain functions to only the owner of the contract.
Functions: The contract includes several functions that allow for creating, transferring, and destroying assets, redeeming items, and checking the balance of an account. These functions contain logic to ensure the appropriate conditions are met before executing, such as ensuring sufficient balance before transferring assets.
Mapping: The contract uses several mappings to keep track of who owns which assets, who has redeemed which items, and the balance of each account.


>Video Walkthrough

https://www.loom.com/share/0eba019277d94cb8a60d53c861343c45
