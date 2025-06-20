// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DocumentNotary {
    struct Document {
        address submitter;
        uint256 timestamp;
    }

    mapping(bytes32 => Document) public documents;

    event DocumentRegistered(bytes32 docHash, address indexed submitter, uint256 timestamp);

    function registerDocument(bytes32 docHash) public {
        require(documents[docHash].timestamp == 0, "Document already registered");

        documents[docHash] = Document(msg.sender, block.timestamp);
        emit DocumentRegistered(docHash, msg.sender, block.timestamp);
    }

    function verifyDocument(bytes32 docHash) public view returns (bool exists, address submitter, uint256 timestamp) {
        Document memory doc = documents[docHash];
        if (doc.timestamp == 0) {
            return (false, address(0), 0);
        }
        return (true, doc.submitter, doc.timestamp);
    }
}
