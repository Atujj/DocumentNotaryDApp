const hre = require("hardhat");

async function main() {
    await hre.run('compile');

    const DocumentNotary = await hre.ethers.getContractFactory("DocumentNotary");
    const notary = await DocumentNotary.deploy();
    await notary.deployed();

    console.log(`✅ DocumentNotary deployed to: ${notary.address}`);
}

main().catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exitCode = 1;
});
