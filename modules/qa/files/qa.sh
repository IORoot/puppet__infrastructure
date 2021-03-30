#!/bin/bash

# Terminal Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color

# Variables
LIGHTHOUSE=false
URL=''
VERBOSE=false

# print to screen
cli_text() {
    if [ "$#" -eq 1 ]; then
        printf "${NC} $1 \n"
    fi
    if [ "$#" -eq 2 ]; then
        COLOUR=$1
        printf "${!COLOUR} $2 \n"
    fi
}

print_usage()
{
    cli_text "RED" "USAGE" >&2
    cli_text "RED" "----------------------------------------" >&2
    cli_text "NC" "$0 -l -v -u [URL]" >&2
    cli_text "RED" "----------------------------------------" >&2
    cli_text "CYAN" "-l    = lighthouse. Use the lighthouse QA tool. Must include a URL" >&2
    cli_text "CYAN" "-u    = URL. The URL to run tests against." >&2
    cli_text "CYAN" "-v    = verbose. Echo the commands being run to the screen." >&2

    exit 1
}


while getopts 'lu:v' flag; do
    case "${flag}" in
        l) LIGHTHOUSE=true ;;
        u) URL="${OPTARG}" ;;
        v) VERBOSE=true ;;
        *) print_usage
    exit 1 ;;
    esac
done

# Must have destination
if [ "$#" -eq 0 ]; then
    print_usage
fi

if [ -z $URL ]; then
    print_usage   
fi

if [ "$LIGHTHOUSE" = true ]; then
    qa_lighthouse $URL
    exit 1
fi