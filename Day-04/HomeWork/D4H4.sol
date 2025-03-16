// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixTranspose {
    function transposeMatrix(uint256[][] memory matrix) public pure returns (uint256[][] memory) {
        uint256 rows = matrix.length;
        uint256 cols = matrix[0].length;
        uint256[][] memory transpose = new uint256[][](cols);
        for (uint256 i = 0; i < cols; i++) {
            transpose[i] = new uint256[](rows);
            for (uint256 j = 0; j < rows; j++) {
                transpose[i][j] = matrix[j][i];
            }
        }
        return transpose;
    }
}
