pragma solidity ^0.4.19;

contract ZombieFactory {
    // declare o nosso evento aqui

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint256 _dna) private {
        zombies.push(Zombie(_name, _dna));
        // dispare o evento aqui
    }

    function _generateRandomDna(string _str) private view returns (uint256) {
        uint256 rand = uint256(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
