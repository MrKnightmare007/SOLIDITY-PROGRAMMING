// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Base contract Employee
contract Employee {
    // State variables
    string public name;
    string public location; // Stores physical location (e.g., city name)
    uint256 public salary;
    string public jobTitle;

    // Constructor to initialize the base contract
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) {
        name = _name;
        location = _location;
        salary = _salary;
        jobTitle = _jobTitle; // Job title is now set by the constructor
    }

    // Virtual functions to be overridden by sub-contracts
    function calculateBonus() public view virtual returns (uint256) {
        return 0; // Base bonus is 0, to be overridden
    }

    function performanceReport() public view virtual returns (string memory) {
        return "Performance report not available.";
    }

    function manageProjects() public view virtual returns (string memory) {
        return "Project management not available.";
    }
}

// Sub-contract Manager
contract Manager is Employee {
    // Constructor now takes _jobTitle as a parameter
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) 
        Employee(_name, _location, _salary, _jobTitle) {}

    // Override bonus calculation for Manager (e.g., 20% of salary)
    function calculateBonus() public view override returns (uint256) {
        return (salary * 20) / 100;
    }

    // Override performance report for Manager
    function performanceReport() public view override returns (string memory) {
        return string(abi.encodePacked("Manager performance: Excellent leadership and coordination. Job Title: ", jobTitle));
    }

    // Override project management for Manager
    function manageProjects() public view override returns (string memory) {
        return string(abi.encodePacked("Manager with title ", jobTitle, " is overseeing multiple projects."));
    }
}

// Sub-contract Developer
contract Developer is Employee {
    // Constructor now takes _jobTitle as a parameter
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) 
        Employee(_name, _location, _salary, _jobTitle) {}

    // Override bonus calculation for Developer (e.g., 10% of salary)
    function calculateBonus() public view override returns (uint256) {
        return (salary * 10) / 100;
    }

    // Override performance report for Developer
    function performanceReport() public view override returns (string memory) {
        return string(abi.encodePacked("Developer performance: High-quality code delivery. Job Title: ", jobTitle));
    }

    // Override project management for Developer
    function manageProjects() public view override returns (string memory) {
        return string(abi.encodePacked("Developer with title ", jobTitle, " contributes to project coding tasks."));
    }
}

// Sub-contract Programmer
contract Programmer is Employee {
    // Constructor now takes _jobTitle as a parameter
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) 
        Employee(_name, _location, _salary, _jobTitle) {}

    // Override bonus calculation for Programmer (e.g., 8% of salary)
    function calculateBonus() public view override returns (uint256) {
        return (salary * 8) / 100;
    }

    // Override performance report for Programmer
    function performanceReport() public view override returns (string memory) {
        return string(abi.encodePacked("Programmer performance: Efficient bug fixing and coding. Job Title: ", jobTitle));
    }

    // Override project management for Programmer
    function manageProjects() public view override returns (string memory) {
        return string(abi.encodePacked("Programmer with title ", jobTitle, " supports project development tasks."));
    }
}