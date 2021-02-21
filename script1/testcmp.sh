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

function main {
    if [ "$#" -ge 1 ]; then
        "$1"
    fi

    if [ "$#" -ge 2 ]; then
        "$2"
    fi
}

main "$@"