// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixOperations {
    function addMatrices(int256[][] memory A, int256[][] memory B) public pure returns (int256[][] memory) {
        uint256 rows = A.length;
        uint256 cols = A[0].length;
        int256[][] memory C = new int256[][](rows);
        for (uint256 i = 0; i < rows; i++) {
            C[i] = new int256[](cols);
            for (uint256 j = 0; j < cols; j++) {
                C[i][j] = A[i][j] + B[i][j];
            }
        }
        return C;
    }

    function subtractMatrices(int256[][] memory A, int256[][] memory B) public pure returns (int256[][] memory) {
        uint256 rows = A.length;
        uint256 cols = A[0].length;
        int256[][] memory C = new int256[][](rows);
        for (uint256 i = 0; i < rows; i++) {
            C[i] = new int256[](cols);
            for (uint256 j = 0; j < cols; j++) {
                C[i][j] = A[i][j] - B[i][j];
            }
        }
        return C;
    }

    function multiplyMatrices(int256[][] memory A, int256[][] memory B) public pure returns (int256[][] memory) {
        uint256 rowsA = A.length;
        uint256 colsA = A[0].length;
        uint256 colsB = B[0].length;
        int256[][] memory C = new int256[][](rowsA);
        for (uint256 i = 0; i < rowsA; i++) {
            C[i] = new int256[](colsB);
            for (uint256 j = 0; j < colsB; j++) {
                C[i][j] = 0;
                for (uint256 k = 0; k < colsA; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }
        return C;
    }
}
