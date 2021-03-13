# Scripting Project 3: Processing Text for Letter Counts
## Due Date: 12 March 2021 at 11:59 pm

### Project Description
In this project, you'll construct a program that interacts with the user,
downloads books from a select list to a local library folder, and counts the
letter frequency of a select book. This program will expand the skills
you have developed in Bash scripting projects 1 and 2 to include working with
lists and mastering the back quote! In order to succeed on this project, you NEED to start early and test often!! Make sure you are ssh'ed in order to test your program.

This project works extensively with ASCII characters and their integer value, so
let's have a quick discussion on how characters we see on the screen are
stored on a computer system. Each character that we see on our terminal screen
is represented by a number between 0-255 (a single Byte). The letter `A` has an
equivalent integer value of 65, `B` a value of 66, up to `Z` with a value of 90.
The uppercase letters (65-90), lowercase letters (97-122), and digits 0-9
(48-57) are continuous.

Our ASCII table contains 256 characters, which means that given an array with
256 elements, we can map every character to an index. The provided `atoi`
function returns the integer value of an ASCII character for this purpose! When
processing a line from a file, we can progress character-by-character, adding 1
to the element stored at the index provided by `atoi` every time we encounter
that character. The result is an array that contains the count for each ASCII
character.

For example, given the word `hello` and counts stored in an array `arr_counts`.
The array would be of length 256 filled with all zeros except for
`arr_counts[104] = 1` for the letter `h`, `arr_counts[101] = 1` for the letter
`e`, `arr_counts[108] = 2` for the letter `l`, and `arr_counts[111] = 1` for the
letter `o`,

**Do not hard code output!** Due to how we test the scripts, it will result in a
failure of nearly all test cases. We will not be testing the script with bad input like decimals, negative numbers or numbers followed by spaces. 

### Provided Files
After running `gethw`, you'll get a file called `summarize.sh`. The general
outline and descriptions for the functions are provided. It is your job to
implement all functions.

There is a compiled executable available to try, invokable via the command
`./solsummarize`. Please use it to test to ensure that your output perfectly
matches the output from the reference solution.

**Hint:** You can use `compare.sh` from the first scripting project to compare
your results to the reference program. No test input files have been provided,
but you can create your own to test functionality, including corner cases.
`diff` or `vimdiff` are also useful tools when trying to compare output from two
files. **Note:** You will likely see different outputs for the case in which
the book has not been downloaded yet. You will have to test this manually
(one script will download the book but the other will not).

### Turn-in Instructions
Type `turnin15L` then follow the prompts :)

### Tips
1. If the script does not work at first, make sure your path to the interpreter is 
    correct (first line of `summarize.sh`).

2. When processing a file line-by-line, you can use `while read line_in; do`
    ... `done < inputfile.txt`. This will result in a file being read one line
    at a time until the end of the file. You can also implement similar
    functionality using a `for` loop.

3. You *will* have to do floating point arithmetic (aha! finally decimal
    points). Use `bc -l` (see [`man -s1 bc`](https://linux.die.net/man/1/bc)) to
    perform your calculation and "scale=" to set the number of numbers to print
    after the decimal point  (for example, an input of "scale=2; 100 / 30"
    prints 3.33).

4. When working with arrays, be sure to use curly brackets when accessing
    values (`${array[0]}`) or when getting the length of an array (`${#array[@]}`).
    For further information on arrays (such as initializing them) you can refer to
    the lecture slides.

5. Remember that backquotes will place the text output of a function in the
    quoted space, which can be useful for accessing array elements
    (``` array[`ord a`] ```) or outputting a capitalized letter
    (``` letter_upper=`toupper a` ```)!

6. To prevent displaying or saving output from a file, redirect standard output
    (`>` or `1>`), standard error (`2>`), or both (`&>`) to the null device
    `/dev/null`.

7. If you are getting a lot of command not found errors, please make sure you are
    not modifying your `PATH` variable! This is an environment variable that
    **should not be modified**. To fix this, you can rename it to something else
    such as `LIBPATH` or something more descriptive. 

8. For the Moby Dick file and `NUM_LINES_TO_PROCESS` of 100, the correct letter
    count is below. Hint: If you have a single value that is off by 6, you likely aren't quoting characters correctly when converting! The files have asterisks, which can have unexpected behavior when passed to `atoi`.

```
--Letter Count--
A 102
B 33
C 63
D 34
E 166
F 12
G 26
H 91
I 56
J 5
K 16
L 41
M 25
N 57
O 81
P 50
Q 2
R 99
S 54
T 130
U 33
V 8
W 21
X 1
Y 23
Z 1
```

## Good luck! Start early and *Finish* early!
