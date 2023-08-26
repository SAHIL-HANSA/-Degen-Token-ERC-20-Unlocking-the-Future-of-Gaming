const { ethers } = require("hardhat");
 
async function main() {
  const Contract = await ethers.getContractFactory("DegenGamingToken"); // Replace "DegenGamingToken" with the actual contract name
  const contract = await Contract.deploy(initialSupply); // Replace "initialSupply" with the desired initial supply for the token
  await contract.deployed();

  console.log("Contract deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
