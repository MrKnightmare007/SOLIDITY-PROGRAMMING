//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Library {
    struct Book {
        string name;
        string author;
        string publisher;
        uint price;
        string branch;
    }

    Book[] public books;

    function addBooks(string memory _name, string memory _author, string memory _publisher, uint _price, string memory _branch) public {
        books.push(Book(_name, _author, _publisher, _price, _branch));
    }

    function getPublisher(string memory _pub) public view returns(Book[] memory) {
        uint count = 0;
        for(uint i = 0; i < books.length; i++) {
            if(keccak256(abi.encodePacked(books[i].publisher)) == keccak256(abi.encodePacked(_pub))) {
                count++;
            }
        }

        Book[] memory pubBook = new Book[](count);
        uint index = 0;
        for(uint i = 0; i < count; i++) {
            if(keccak256(abi.encodePacked(books[i].publisher)) == keccak256(abi.encodePacked(_pub))) {
                pubBook[index] = books[i];
                index++;
            }
        }
        return pubBook;
    }

        function getBranch(string memory _branch) public view returns(Book[] memory) {
        uint count = 0;
        for(uint i = 0; i < books.length; i++) {
            if(keccak256(abi.encodePacked(books[i].branch)) == keccak256(abi.encodePacked(_branch))) {
                count++;
            }
        }

        Book[] memory branchBook = new Book[](count);
        uint index = 0;
        for(uint i = 0; i < count; i++) {
            if(keccak256(abi.encodePacked(books[i].branch)) == keccak256(abi.encodePacked(_branch))) {
                branchBook[index] = books[i];
                index++;
            }
        }
        return branchBook;
    }
}