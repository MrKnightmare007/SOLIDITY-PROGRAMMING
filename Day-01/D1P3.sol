// Temperature Conversion
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract TemperatureConverter {
    int256 public s = 1e18; 
    // Function to convert Celsius to Fahrenheit with more precision
    function celsiusToFahrenheit(int256 celsius) public view returns (int256) {
        // Multiply by 10 before division to handle the decimal part
        int256 fahrenheit = ((celsius * 9 * s) / 5) + (32 * s); // scale by 10
        return fahrenheit; // return the result scaled back
    }
}
