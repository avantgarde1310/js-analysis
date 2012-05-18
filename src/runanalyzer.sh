#!/bin/bash

###############################################################################
# A simple bash script to run the module on the top 55 extensions located in
# the CSPfied extensions directory. This script has to be put in the jsAnalysis
# directory. 
# 
# It will run driver.py on each of the extensions located in the directory
# specified by ext_path, and also keeping a time limit for all of them. It will
# also create a log file (results.txt) in the same directory that reports
# whether running driver.py on an extension succeeded or failed because of an
# exception or timeout.
###############################################################################

# The path where the extensions are located (jsAnalysis/test/extensions)
ext_path="../tests/extensions"
out_file="../tests_out/results.txt"

# TIMEOUT is the time limit in seconds
TIMEOUT=120

echo "Analysis Result" > $out_file

success_count=0
total_count=0

for path in $(ls $ext_path); do

    (( total_count += 1 ))
    
    # Append extension ID to results.txt
    echo -n "Extension ID: $path | " >> $out_file

    # Run module
    echo
    echo "Running process driver.py on extension ID : $path ..."

    ./driver.py -o ../tests_out -w datalogfacts -e "$ext_path/$path" &
    module_pid=$!

    start_time=$(( $(date +%s) ))
    end_time=$(( $(date +%s) + $TIMEOUT ))
    success=0

    echo "PID = $module_pid"
    echo "Start Time = $start_time"
    echo "End Time = $end_time"

    while (( $(date +%s) < $end_time )); do
        if ! kill -0 $module_pid 2> /dev/null; then
            success=1
            break
        fi
        sleep 1
    done
    
    # Obtain error code from process
    wait $module_pid
    error_code=$?

    echo "Error code after while loop : $error_code"
    echo "Success code : $success"

    # If successfully exited the loop, then program did not time out.
    if [ $success -eq 1 ]; then
        if [ $error_code -eq 0 ]; then
            echo " Status: Success" >> $out_file
            (( success_count += 1 ))
        elif [ $error_code -eq 2 ]; then
            echo " Status: Error on AST Creation (pynarcissus)" >> $out_file
        elif [ $error_code -eq 4 ]; then
            echo " Status: Error on alpha-renaming phase" >> $out_file 
        elif [ $error_code -eq 5 ]; then
            echo " Status: Error on three-address code generation" >> $out_file
        elif [ $error_code -eq 6 ]; then
            echo " Status: Error on datalog facts generation" >> $out_file
        fi
        continue
    fi

    echo
    echo " Status: Timeout (program ran more than $TIMEOUT seconds)" >> $out_file

    kill -KILL $PID
    echo "Process $PID forcefully killed"
    
done

echo "$total_count extensions analyzed. Out of $total_count extensions,
$success_count extensions had their Datalog files successfully
generated." >> $out_file

