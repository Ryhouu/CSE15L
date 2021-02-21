## Scripting Project 1: Compare Output
## Due Date: 21 Feb 2021 at 11:59 pm

### Project Description
In this project, you'll begin to build your scripting abilities by creating a script that compares the outputs of two programs. This project will help acclimate you to:
* Using variables and positional parameters
* Implementing if-then statements
* Understanding control-flow logic with user input

Your script will compare the output of your program to a reference program for cases that require user input (`-i input_file`) and cases that do not. We hope that you will use this script to check if your future scripting projects are correct!

**Do not hard code output!** Due to how we test the scripts, it will result in a failure of nearly all test cases.

### Provided Files
After running `gethw`, you'll get a file called
`compare.sh`. The general outline of six functions are provided.
It is your job to implement the six incomplete functions (`check_results`, `clean`, `prog_compare`, `prog_compare_with_input`, `check_permissions`, and `print_error_and_exit`).

There are two provided test folders for you to ensure your project works correctly (test1 and test2).

##### test1
The first test case (test1) creates a unique password based on the current date and time with the program `genpwd`. You can run the program to examine the output using `./genpwd`. Your friend generated several possible implementations based on different time zones, and your goal is to use your script to determine in which timezone the original program was compiled. There are four programs to test (`test_tz1`, `test_tz2`, `test_tz3`, `test_tz4`) and a solution `genpwd`. Use your script to determine which test program is correct (the output matches the solution file).

##### test2
The second test (test2) generates a histogram of letter distributions for an input piece of text until the EOF character is reached (Ctrl-D) with the program `letterfreq`. You can run the program to examine the output using `./letterfreq < inputfile.txt`. Similar to test1, there are four test programs and a solution, use your script to determine which test program is correct. We have provided a few different test files in the form of poems from Henry D. Thoreau.

### How to Run
Usage: `./compare.sh myprog solprog` \
`./compare.sh -i test_input myprog solprog`

There are two ways of running this script, one for programs without inputs and one with inputs.

For comparing differences with programs with no inputs simply run your script as follows:
`./compare.sh your_prog sol_prog`
The arguments to the script should be the path name to the program.

For comparing differences with programs with inputs, run your program with the -i flag:
`./compare.sh -i input_file your_prog sol_prog`

### Turn-in Instructions
Type `turnin15L` then follow the prompts :)

### Tips
1. Read the descriptions of the functions, along with the TODO statements and understand the flow of the code. To help locate which parts of the code should be changed, we included the `???` function, which we have tried to place where we think the code should go! Whenever the `???` function is reached, it will print out the line where it is located in your script.

2. Be sure to use the variables `MY_OUTPUT`, `SOL_OUTPUT`, and `DIFF_RESULTS` when saving output and comparing! Don't hard code your filenames!

3. Create your own programs and solution files to test your script!

4. Feel free to ask questions during tutor hours or Piazza.

## Good luck! Start early and *Finish* early!
