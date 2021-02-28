# Scripting Project 2: Parallelograms
## Due Date: 2 March 2021 at 11:59 pm

![example](https://i.imgur.com/OnpLqVr.png)

### Project Description
In this project, you'll start to build some more fluency in your scripting
abilities by implementing this parallelogram printer. This simple program will
help acclimate you with doing arithmetic in Bash, using loops, using variables,
and writing control-flow logic with user input.

**Do not hard code output!** Due to how we test the scripts, it will result in a
failure of nearly all test cases.

### Provided Files
After running `gethw`, you'll get a file called `parallelograms.sh`. The general
outline and descriptions for the functions are provided. It is your job to
implement all the functions that have TODO statements.

There is a public executable available to try, invokable via the command
`./solparallelograms`. Please use it to test to ensure that your output perfectly
matches the output from the reference solution.

**Hint:** You can use `compare.sh` from the first scripting project to compare
your results to the reference program. Two test input files have been provided
(`input10.txt` and `input3-5.txt`). You can use these files with `compare.sh`
by running `compare.sh` with the `-i` option. For example, try:

`compare.sh -i input10.txt parallelograms.sh solparallelograms`

When you look at the test inputs, notice that each separate line relates to the
user input that would otherwise be entered by the keyboard. Try creating your
own test files, including corner cases. `diff` or `vimdiff` are also useful
tools when trying to compare output from two files.

__We will not be testing you on invalid input such as: entering a word for 
the prompt, having multiple inputs for the prompt (separated by spaces),
entering invalid characters for the prompt ("-", "$", "@", numbers etc.),
entering a non-number for the size, entering a "negative number" for the 
size, entering a number larger than MAX_INT for the size. Additionally,
we will be testing your reprompt message with a single character followed
by a newline character.__

### Turn-in Instructions
Type `turnin15L` then follow the prompts :)

### Tips
1. You *will* have to do arithmetic. Your options for arithmetic include `bc`
    (see [`man -s1 bc`](https://linux.die.net/man/1/bc)), `expr` (see
    [`man -s1 expr`](https://linux.die.net/man/1/expr)), or `(( ... ))`.

2. Try first writing the program in any language of your choice (like Python,
    C, C++, Java, etc) to iron out the logic. Then, once you've nailed that,
    progress to translating to Bash.

3. If you try to use a range-based `for` loop, remember that you cannot use
    variables inside of it. Statements like `for i in {0..$max}` do not work in
    Bash (but `for i in {0..10}` does work).
    How can you account for this?

4. You may have already noticed this, but the parallelogram pattern is really
    just two triangles printed on a slant and mirrored over the y-axis. This
    should simplify your code! Feel free to add functions if you think it would
    simplify your code.

## Good luck! Start early and *Finish* early!
