pragma solidity ^0.8.0;

contract Vote {
    struct Candidate {
        uint id;
        string name;
        string visi;
        string misi;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    uint public candidateCount;

    event CandidateAdded(uint candidateId, string name);
    event VoteCast(uint candidateId, uint voteCount);

    constructor() {
        candidateCount = 0;
    }

    function addCandidate(string memory name, string memory visi, string memory misi) public {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, name, visi, misi, 0);
        emit CandidateAdded(candidateCount, name);
    }

    function castVote(uint candidateId) public {
        require(candidateId > 0 && candidateId <= candidateCount, "Invalid candidate ID!");
        candidates[candidateId].voteCount++;
        emit VoteCast(candidateId, candidates[candidateId].voteCount);
    }

    function getCandidate(uint candidateId) public view returns (Candidate memory) {
        require(candidateId > 0 && candidateId <= candidateCount, "Invalid candidate ID!");
        return candidates[candidateId];
    }
}
