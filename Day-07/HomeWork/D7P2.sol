// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibraryManagement {
    // Define the Book structure
    struct Book {
        string name;
        string author;
        string publisher;
        uint256 price;
        string branch; // fiction, biography, thrillers, etc.
        uint256 id;
    }
    
    // Array to store all books
    Book[] private books;
    
    // Counter for book IDs
    uint256 private nextBookId;
    
    // Mapping from publisher to array of book indices
    mapping(string => uint256[]) private publisherToBooks;
    
    // Mapping from branch to array of book indices
    mapping(string => uint256[]) private branchToBooks;
    
    // Event emitted when a new book is added
    event BookAdded(uint256 id, string name, string publisher, string branch);
    
    constructor() {
        nextBookId = 1;
    }
    
    // Function to add a new book
    function addBook(
        string memory _name,
        string memory _author,
        string memory _publisher,
        uint256 _price,
        string memory _branch
    ) public {
        uint256 bookId = nextBookId++;
        
        books.push(Book({
            name: _name,
            author: _author,
            publisher: _publisher,
            price: _price,
            branch: _branch,
            id: bookId
        }));
        
        uint256 bookIndex = books.length - 1;
        
        // Add book index to publisher mapping
        publisherToBooks[_publisher].push(bookIndex);
        
        // Add book index to branch mapping
        branchToBooks[_branch].push(bookIndex);
        
        emit BookAdded(bookId, _name, _publisher, _branch);
    }
    
    // Function to get the total number of books
    function getBookCount() public view returns (uint256) {
        return books.length;
    }
    
    // Function to get a specific book by index
    function getBook(uint256 index) public view returns (
        string memory name,
        string memory author,
        string memory publisher,
        uint256 price,
        string memory branch,
        uint256 id
    ) {
        require(index < books.length, "Index out of bounds");
        Book memory book = books[index];
        return (
            book.name,
            book.author,
            book.publisher,
            book.price,
            book.branch,
            book.id
        );
    }
    
    // Function to get all books by a specific publisher
    function getBooksByPublisher(string memory publisher) public view returns (Book[] memory) {
        uint256[] memory bookIndices = publisherToBooks[publisher];
        Book[] memory result = new Book[](bookIndices.length);
        
        for (uint256 i = 0; i < bookIndices.length; i++) {
            result[i] = books[bookIndices[i]];
        }
        
        return result;
    }
    
    // Function to get all books in a specific branch
    function getBooksByBranch(string memory branch) public view returns (Book[] memory) {
        uint256[] memory bookIndices = branchToBooks[branch];
        Book[] memory result = new Book[](bookIndices.length);
        
        for (uint256 i = 0; i < bookIndices.length; i++) {
            result[i] = books[bookIndices[i]];
        }
        
        return result;
    }
    
    // Function to check if a publisher exists
    function publisherExists(string memory publisher) public view returns (bool) {
        return publisherToBooks[publisher].length > 0;
    }
    
    // Function to check if a branch exists
    function branchExists(string memory branch) public view returns (bool) {
        return branchToBooks[branch].length > 0;
    }
    
    // Function to get all available publishers
    function getAllPublishers() public view returns (string[] memory) {
        // This is a simplified implementation
        // In a real-world scenario, we would need to track unique publishers
        string[] memory publishers = new string[](books.length);
        uint256 count = 0;
        
        for (uint256 i = 0; i < books.length; i++) {
            bool isDuplicate = false;
            for (uint256 j = 0; j < count; j++) {
                if (keccak256(bytes(publishers[j])) == keccak256(bytes(books[i].publisher))) {
                    isDuplicate = true;
                    break;
                }
            }
            
            if (!isDuplicate) {
                publishers[count] = books[i].publisher;
                count++;
            }
        }
        
        // Resize the array to the actual count
        string[] memory result = new string[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = publishers[i];
        }
        
        return result;
    }
    
    // Function to get all available branches
    function getAllBranches() public view returns (string[] memory) {
        // Similar implementation as getAllPublishers
        string[] memory branches = new string[](books.length);
        uint256 count = 0;
        
        for (uint256 i = 0; i < books.length; i++) {
            bool isDuplicate = false;
            for (uint256 j = 0; j < count; j++) {
                if (keccak256(bytes(branches[j])) == keccak256(bytes(books[i].branch))) {
                    isDuplicate = true;
                    break;
                }
            }
            
            if (!isDuplicate) {
                branches[count] = books[i].branch;
                count++;
            }
        }
        
        // Resize the array to the actual count
        string[] memory result = new string[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = branches[i];
        }
        
        return result;
    }
}