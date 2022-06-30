# solidity-demo

# Token.sol
This is a demo contract. It is deployed at https://rinkeby.etherscan.io/address/0xC8245529A7ee05625c364c725d17885e15bdcD45 
User can buy tokens for 1 Ether. It Emits event when user checks his balance. It stores the ethers in contract.

**Functions**
buyToken() to purchase tokens
checkBalance() to check users balance
withdrawMoney() so user can money from the contract 

# Rent.sol
This contract is a rent paying system for property or anything. Rent is declared at the declaration. User can pay rent when ever he wants.
this rent is stored in contract, owner can take the rent from contract any time he wants.

# AddressBook.sol
This contract maps the address to a name. This can be only done by the Deployer of the Contract(Owner). Anyone can search the address from the record mapping.

# Charity.sol
This contract is basically a payment splitter. It provide equal share of the received payment to the recipients. 
People can send ether in two ways 
1. Invoking the sendMoney function
2. Sending ethers directly to the address of the contract.
