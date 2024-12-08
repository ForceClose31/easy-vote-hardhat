const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("VoteModule", (m) => {
  const voteContract = m.contract("Vote");
  return { voteContract };
});
