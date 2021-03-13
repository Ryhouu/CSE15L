#!/bin/bash
# TODO: Complete the first line of the script with the correct location for
# bash
#
# Name: Ruoyu Hou
# PID: A16411588
# Account ID: cs15lwi21asp
# File: summarize.sh
# Assignment: Scripting Project 3
# Date: 03/09/2021
#
#
#===============================================================================
# DO NOT TOUCH BELOW THIS LINE
#===============================================================================
LIST_TITLES=("Moby-Dick; or, The Whale" \
             "Gadsby"                   \
             "Pride and Prejudice")
LIST_AUTHORS=("Herman Melville"         \
              "Ernest Vincent Wright"   \
              "Jane Austin")
LIST_ADDR=("https://www.gutenberg.org/files/2701/2701-0.txt"    \
           "http://www.gutenberg.org/files/47342/47342.txt"     \
           "http://www.gutenberg.org/files/1342/1342-0.txt")
LIST_FILES=("mobydick.txt"              \
            "gadsby.txt"                \
            "pride and prejudice.txt")
DIR_LIBRARY="library"
ERR_USAGE="Usage: ./summarize.sh"
ERR_INPUT="Invalid book. Selection must be [1, ${#LIST_TITLES[@]}]"
MSG_PROMPT="Which book from the above list would you like to proccess? "
LETTERS=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
# atoi
# Function converts an ascii character to the corresponding integer value
function atoi {
    printf '%d' "'$1"
}
# toupper
# Function converts all input characters to uppercase
function toupper {
    echo ${1^^}
}
# download_book
# Function downloads a book from the addresses listed in LIST_ADDR and saves it
# in the library (DIR_LIBRARY) and corresponding file in LIST_FILES. On any
# error, the function will cause the script to terminate with exit code 1.
#
# USAGE
#   download_book ind
#
# INPUT
#   ind: index of the book to be downloaded
function download_book {
    ind="$1"
    if  [ "$ind" -le ${#LIST_ADDR[@]} ] &> /dev/null &&        \
        [ "$ind" -le ${#LIST_TITLES[@]} ] &> /dev/null &&      \
        [ "$ind" -le ${#LIST_AUTHORS[@]} ] &> /dev/null &&     \
        [ "$ind" -le ${#LIST_FILES[@]} ] &> /dev/null
        then
        echo "Downloading \"${LIST_TITLES[$ind]}\" from ${LIST_ADDR[$ind]}."
        if curl "${LIST_ADDR[$ind]}" > "${DIR_LIBRARY}/${LIST_FILES[$ind]}" 2> /dev/null; then
            echo "Download success!"
        else
            echo "Download error."
            exit 1
        fi
    else
        echo "Index $ind is out of bounds."
        exit 1
    fi
    sleep 1
}
OFFSET_A=`atoi A`
#===============================================================================
# DO NOT TOUCH ABOVE THIS LINE
# ========================== YOUR CODE STARTS BELOW ===========================
NUM_LINES_TO_PROCESS=100    # Controls the number of lines that are processed
# check_library
# Function checks if the directory saved in DIR_LIBRARY exists or not.
# If the directory exists, then "Found library at ${LIBPATH}" is printed, where
# LIBPATH is the full path to the directory starting at root (/), and the
# function returns with status code 0.
# If the directory does not exist, then "Making ${DIR_LIBRARY}" is printed,
# where DIR_LIBRARY is the relative path of the library as defined above, the
# directory is made, and the function returns with status code 1.
#
# USAGE
#   check_library
function check_library {
    # TODO: Check if the directory exists and implement the functionality as
    # described in the function description. If you decide to store LIBPATH
    # (from the function description) as a variable, name it LIBPATH!
    if [ -d "${DIR_LIBRARY}" ]; then
        PWD=`pwd`
        LIBPATH="${PWD}/${DIR_LIBRARY}"
        echo "Found library at ${LIBPATH}"
        return 0
    else
        echo "Making ${DIR_LIBRARY}."
        mkdir "${DIR_LIBRARY}"
        return 1
    fi
}
# check_book
# Function checks if the .txt file of the book selected by ind exists or not.
# If the .txt file exists, then the function returns with status code 0.
# If file does not exist, then "[Download Required]" is printed and the
# function returns with status code 1.
#
# USAGE
#   check_book ind
#
# INPUT
#   ind: index of the book to be checked
function check_book {
    # TODO: Create a variable that contains the path to the book selected by the
    # first input argument
    ind_book=$1
    book_path="${DIR_LIBRARY}/${LIST_FILES[ind_book]}"
    # TODO: Check if the file at the defined path exists and implement the
    # functionality as described in the function description.
    if [[ -e "$book_path" ]]; then
        return 0
    else
        echo -n "[Download Required]"
        return 1
    fi
}
# count_characters
# Function that counts the number of occurrences of each ASCII character from
# the first lines in a file up to NUM_LINES_TO_PROCESS. The count is stored in
# an array and then the counts for each letter are printed to the terminal with
# upper and lowercase counts summed together.
#
# USAGE
#   count_characters path
#
# INPUT
#   path: path to the file being processed (example "path/file.txt")
function count_characters {
    path_in="$1"
    print_line_statistics "$path_in"
    # TODO: Initialize array to store the counts of the different ASCII
    # characters. Since there are 256 possible ASCII characters,
    declare -a ascii_count
    # TODO: Initialize the array with 256 elements and set each element equal
    # to 0.
    for (( i = 0; i < 256; i ++ )); do
        ascii_count[$i]=0
    done
    # TODO: Iterate through a file line-by-line from the first line for
    # NUM_LINES_TO_PROCESS consecutive lines. Count the number of occurrences
    # of each ASCII character and save it to the above defined array.
    line_num=0
    while read line_in; do
        ((line_num++))
        # echo "Line ${line_num}" # This line may be useful for debugging
        # TODO: Iterate through a line character-by-character and add 1 to the
        # correct element in the array. Use `atoi $character` to get the proper
        # index where character is the current character.
        for ((i = 0; i < ${#line_in}; i ++)); do
            char=${line_in:$i:1}
            ind=`atoi "$char"`
            ((ascii_count[$ind] ++))
        done
        # TODO: After processing NUM_LINES_TO_PROCESS lines, exit from the loop
        if [ ${line_num} -ge ${NUM_LINES_TO_PROCESS} ]; then
            break
        fi
    done < "${path_in}"
    # TODO: Print the counts to the terminal. For a given letter, sum the counts
    # of the lowercase and uppercase variants of the letter.
    echo
    echo "--Letter Count--"
    for letter in "${LETTERS[@]}"; do
        letter_upper=`toupper "$letter"`
        # TODO: add your code here and modify the echo statement
        ind_lower=`atoi "${letter}"`
        ind_upper=`atoi "${letter_upper}"`
        count_lower=${ascii_count[ind_lower]}
        count_upper=${ascii_count[ind_upper]}
        echo "$letter_upper $((count_lower + count_upper))"
    done
}
# print_booklist
# Function prints out the titles and authors of each book listed in LIST_TITLES.
# Each book is prefaced by a number and right paranthesis that begins at 1. The
# title and author should be separated using " by ". If the .txt file is not
# located in the DIR_LIBRARY folder, then add the text [Download Required] after
# the book and author.
#
# For example:
# 1) Moby-Dick; or, The Whale by Herman Melville
# 2) Gadsby by Ernest Vincent Wright [Download Required]
# 3) Pride and Prejudice by Jane Austin [Download Required]
#
# USAGE
#   print_booklist
function print_booklist {
    echo
    echo "The following books are available:"
    # TODO: Print out the list of books as described in the function description
    # so that it matches the example. (HINT: You can use check_book, which
    # checks if the text file of the selected book exists in the library. Which
    # type of quotes can you use to capture the output of a function?)
    for ((i = 1; i <= ${#LIST_TITLES[@]}; i ++)); do
        ind_book=$((i-1))
        echo "$i) ${LIST_TITLES[ind_book]} by ${LIST_AUTHORS[ind_book]} $(check_book $ind_book)"
    done
}
# print_line_statistics
# Function that prints the total number of lines in an input text file, the
# number of lines to be processed based on the variable NUM_LINES_TO_PROCESS,
# and the percentage of the file that will be parsed based on those line counts.
# Percentage ranges between 0.00 and 100.00 and must be calculated to exactly
# 2 decimal places. (HINT: Try looking at how bc should be used.)
#
# USAGE
#   print_line_statistics path
#
# INPUT
#   path: path to the file being processed (example "path/file.txt")
function print_line_statistics {
    path_in="$1"
    # TODO: Implement the functionality described in the function description
    # add your code here and modify the print statements.
    num_lines=`wc -l < "${path_in}"`
    pct=$(echo "scale=2;100*${NUM_LINES_TO_PROCESS}/${num_lines}" | bc)
    echo "${path_in} has ${num_lines} lines"
    echo "Processing the first $NUM_LINES_TO_PROCESS lines (${pct}%)"
}
# print_input_error_and_exit
# Function that prints an error to stdout notifying the user of the correct
# range of valid input values and then terminates the script with exit status
# code 1
#
# USAGE
#   print_input_error
function print_input_error_and_exit {
    # TODO: Implement the functionality  described in the function description
    echo $ERR_INPUT >&1
    exit 1
}
# main
# Function that prints a list of available books for processing, takes in a user
# selection, and then performs a count of the letter frequency within the
# selected book. If the .txt file of the book is not in the library (as denoted
# by the folder at DIR_LIBRARY), then the .txt file is downloaded.
#
# USAGE
#   main
function main {
    # Check that a library folder exists
    check_library
    # Print a list of available books
    print_booklist
    # TODO: Prompt the user for which book they would like to process and save
    # the result in the variable ind_book. (HINT: The printed book list starts
    # at 1 but bash lists are indexed by 0. Solve this however you like! But
    # make sure that your code is consistent.)
    echo -n "$MSG_PROMPT"
    read ind_book
    # Check that the user input is an integer and in a valid range
    if ! [ "$ind_book" -eq "$ind_book" ] &> /dev/null; then
        # The above test-command checks that the input argument is a valid
        # integer by trying to convert it to a number. If the conversion
        # fails, then [ "$1" -eq "$1" ] has an exit status code of 2, which
        # can be inverted using !.
        print_input_error_and_exit
    # TODO: Check that the user input is in a valid range as defined by the
    # number of elements in LIST_TITLES
    elif [ $ind_book -lt 1 ] || [ $ind_book -gt ${#LIST_TITLES[@]} ]; then
        print_input_error_and_exit
    else
        ind_book=$(($ind_book - 1))
        # TODO: Form the path to the .txt file of the book (this variable will
        # be used later!). It would be wise to create a variable to save the
        # path.
        path_book="${DIR_LIBRARY}/${LIST_FILES[$ind_book]}"
    fi
    # Check if the book has been downloaded already by using the check_book
    # function. If it is not in the library, then download the book.
    # (HINT: Use backslash \ to escape " characters so that they display
    # properly with echo)
    if check_book "${ind_book}" &> /dev/null; then
        echo "\"${LIST_TITLES[$ind_book]}\" found in library"
    else
        echo "\"${LIST_TITLES[$ind_book]}\" not found in library"
        download_book "${ind_book}"
    fi
    # TODO: Count the frequency of characters by calling the function
    # count_characters with the newly formed path as the argument.
    count_characters "$path_book"
}
#===============================================================================
# DO NOT TOUCH BELOW THIS LINE
#===============================================================================
function ??? {
    echo "WARNING! TODO on line ${BASH_LINENO[0]} not implemented (or ??? was" \
         "not removed)" 1>&2
}
if [ $# -gt 0 ]; then
    echo "$ERR_USAGE"
    exit 1
fi
main
# check_library
#===============================================================================
# DO NOT TOUCH ABOVE THIS LINE
#===============================================================================