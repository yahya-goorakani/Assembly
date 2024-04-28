# Assembly Language Program README

## Program Description
This assembly language program displays a message "Hello, my name is GOOYA" on the console. It uses DOS interrupts to print the message and terminate the program.

## Program Structure
- **Model**: `small`
- **Stack**: `100h` (100 bytes)
- **Data Section**:
  - `Massage`: Declares a message string "Hello, my name is GOOYA" terminated by a carriage return (13), line feed (10), and a null terminator ('$').
- **Code Section**:
  - **Hello Proc**: Procedure responsible for printing the message.
    - Loads the data segment address into `DS` register.
    - Loads the offset of the message string into `DX` register.
    - Calls DOS interrupt `21h` with function `09h` to print the message.
    - Terminates the program by setting `AH` to `04ch` and calling interrupt `21h`.

## How to Run
1. Assemble the program using an assembler such as TASM (Turbo Assembler).

- tasm program.asm

2. Link the object file to create an executable file.
tlink program.obj OR link program.obj

3. Run the executable file.
program.exe


4. The message "Hello, my name is GOOYA" will be displayed on the console.

## Files
- `program.asm`: Assembly code file.
- `program.obj`: Object file generated after assembling.
- `program.exe`: Executable file generated after linking.

## Additional Notes
- This program is designed to run on DOS or an environment that supports DOS interrupts.
- You may need to adjust the file names and paths according to your system's configuration