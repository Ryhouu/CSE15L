MY_OUTPUT="tmp_prog.txt"
MY_ERR="tmp_prog_err.txt"
SOL_OUTPUT="tmp_sol.txt"
SOL_ERR="tmp_sol_err.txt"
DIFF_RESULTS="results.txt"

LIST_FILES=("mobydick.txt"              \
            "gadsby.txt"                \
            "pride and prejudice.txt")

function test_script3 {
    echo "Testing script3 ......"

    prog="summarize.sh"
    solprog="solsummarize"


    for i in {1..4}; do
        input="input_$i.txt"
        echo "testing ${LIST_FILES[$((i - 1))]}"
        if [ $i -ge 2 ] && [ $i -le 3 ]; then
            rm -f "library/""${LIST_FILES[$((i - 1))]}"
        fi
        ./${prog} < ${input} > ${MY_OUTPUT} 2> ${MY_ERR}
        if [ $i -ge 2 ] && [ $i -le 3 ]; then
            rm -f "library/""${LIST_FILES[$((i - 1))]}"
        fi
        ./${solprog} < ${input} > ${SOL_OUTPUT} 2> ${SOL_ERR}
        check_results "${MY_OUTPUT}" "${SOL_OUTPUT}"
    done
}

function check_results {
    output1="$1"
    output2="$2"

    # TODO: Compare the results using diff and save it to the filename stored in
    # the variable DIFF_RESULTS
    diff ${output1} ${output2} > ${DIFF_RESULTS}

    # TODO: Check if the file stored in DIFF_RESULTS contains any characters
    if [ -s ${DIFF_RESULTS} ]; then
        echo "Outputs are not identical. :("
        echo "Check out ${DIFF_RESULTS} for more details" >&2
    else
        echo "Outputs are identical. Great job!"
        rm "${DIFF_RESULTS}"
    fi
}

test_script3