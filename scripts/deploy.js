const { ethers } = require("hardhat");

async function main() {
  const DocumentNotary = await ethers.getContractFactory("DocumentNotary");
  const contract = await DocumentNotary.deploy();
  await contract.deployed();

  console.log("DocumentNotary deployed to:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
