# Assembly Language Program Readme

This assembly language program takes two input values, computes the expression \(a - 2b\), and displays the result in decimal format.

## Program Overview

### Data Segment
- `msg`: Prompt to enter value for 'a'.
- `msg1`: Prompt to enter value for 'b'.
- `result`: Message to display the result.

### Code Segment
1. **Initialization**: Initializes the data segment and sets up necessary variables.
2. **Input 'a'**: Prompts user to enter value for 'a' and reads the input.
3. **Input 'b'**: Prompts user to enter value for 'b' and reads the input.
4. **Compute**: Computes the expression \(a - 2b\).
5. **Display Result**: Displays the result in decimal format.

### Subroutines
- `readNumber`: Reads a single digit and converts it to binary.
- `DecimalConv`: Converts the result to a decimal string.

## How to Use
1. Assemble and link the program using an appropriate assembler and linker.
2. Run the executable.
3. Follow the prompts to enter values for 'a' and 'b'.
4. The program will display the result of the expression \(a - 2b\) in decimal format.

## Additional Notes
- Ensure proper termination of the program after displaying the result.
- The program assumes a valid input within the range of single digits.

## Files
- `program.asm`: Assembly language source code.
- `readme.md`: This documentation file.

Feel free to customize and integrate this code into your projects!
