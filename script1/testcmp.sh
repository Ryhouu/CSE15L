#!/bin/bash

function test1 {
    echo "Running test1 ......."
    echo
    
    solprog="test1/genpwd"
    
    for i in {1..4}; do
        prog="test1/test_tz""$i"
        echo "-------- Testing test_tz""$i"" ---------"
        ./compare.sh ${prog} ${solprog}
        echo "-----------------------------------"
        echo
    done
    
}

function test2 {
    echo "Running test2 ......."
    
    solprog="test2/letterfreq"

    for i in {1..3}; do
    echo
        echo "------ Testing poem"$i"------"
        input_file="test2/poem""$i"".txt"
        for j in {1..4}; do
            # chmod u+rx ${prog}
            prog="test2/test_lf""$j"

            ./compare.sh -i ${input_file} ${prog} ${solprog}

            echo "---------------------------- "
        done
    done
}

function test_script2 {
    echo "Testing script2 ......"

    prog="../script2/parallelograms.sh"
    solprog="../script2/solparallelograms"
    input_file1="../script2/input3-5.txt"
    input_file2="../script2/input10.txt"
    input_file3="../script2/input_1_21.txt"

    ./compare.sh -i ${input_file1} ${prog} ${solprog}
    ./compare.sh -i ${input_file2} ${prog} ${solprog}
    ./compare.sh -i ${input_file3} ${prog} ${solprog}

}

function main {
    for arg in "$@"; do
        "$arg"
    done
}

main "$@"