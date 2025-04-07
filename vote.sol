// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Election {

struct Candidate{
    string name;
    uint votes;
    bool exist;
}

mapping (address => bool) public alreadyVoted;

Candidate[] public candidates;

address public owner1;

modifier  onlyowner(){
    require( msg.sender == owner1, "just the owner can vote");
    _;
}

constructor(){
    owner1 = msg.sender;
}


function addCandidate(string memory _name) public {
candidates.push(Candidate({
            name: _name,
            votes: 0,
            exist: false

        }));



}

function vote(uint _id) public {
    require(!alreadyVoted[msg.sender],"already voted");
   // require(_id< candidates.lenght,"invalid candidate");
 candidates[_id].votes++;
 alreadyVoted[msg.sender] = true;

}

function getWinner() public  view returns (string memory name, uint votes){
uint plus = 0;
uint idwinner;

for (uint i = 0; i < candidates.length; i++){
    if(candidates[i].votes > plus) {
        plus= candidates[i].votes;
        idwinner = i;
    }

    name = candidates[idwinner].name;
    votes = candidates[idwinner].votes;

}
}

// function getWinner() public  view returns (string memory name, uint votes){
// uint plus = 0;
// uint idwinner;

// for (uint i = 0; i < candidates.lenght; i++){
//     if(Candidate[i].votes > plus) {
//         plus= Candidate[i].votes;
//         idwinner = i;
//     }

//     name = Candidate[idwinner].name;
//     votes = Candidate[idwinner].votes;

// }
// }

}








