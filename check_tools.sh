#!/usr/bin/env bash
#
# check_tools.sh:
#
# Example script that checks for tools in comand line

echo "Checking for available tools:"

Tools="make python3 iverilog verilator"
errors=0

for tool in $Tools; do
    if ! command -v $tool &> /dev/null
    then
        echo -e "\tError: $tool is not available"
        errors=1
    else
        echo -e "\tCheck: $tool is available"
    fi
done

exit $errors
