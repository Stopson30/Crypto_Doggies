
// this operates based on the solidity extension 

pragma solidity ^0.4.18;

contract CryptoDoggies {

    uint age = 10;
    uint maxAge = age * 5;
    uint minAge = age * 0.5;
    string name = "Maximillien"; //these will be immutable when pushed onto Blockchain
    string name2 = "Robespierre";

    struct Doggy {
        uint age;
        string name;
        byte5 dna;
    }

    Doggy[] doggies;

    mapping (uint256 => address) private doggyIdToOwner;
    mapping (address => uint256) private numOfDoggies;

    event DoggyCreated(uint256 _id, string _name, uint _age, bytes5 _dna);

    Doggy doggy1 = Doggy({
        age: age,
        name: name,
        dna: byte5(0x00000000)
    });

    Doggy doggy2 = Doggy({
        age: maxAge,
        name: name2,
        dna: bytes5(0xffffffff)
    });

    function createDoggy(uint _age, string _name, bytes5 _dna) public { //this function being public, now this can be tested  in Remix
        Doggy memory _doggy = Doggy({
            age: _age,
            name: _name,
            dna: _dna
        });
        uint256 newDoggyId = doggies.push(_doggy) - 1;
        doggyIdToOwner[newDoggyId] = msg.sender;
        numOfDoggies[msg.sender] = numOfDoggies[msg.sender] + 1;
        DoggyCreated(newDoggyId, _name, _age, _dna);
    }

}


