#!/bin/bash

RUN="lighthouse"
PWD=`/bin/pwd`
WWW="/var/www/sites/qa/lighthouse/"
CHROMEFLAGS="--no-sandbox --headless --disable-gpu"

# Terminal Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color

# Echo to CLI
cli_text() {
    if [ "$#" -eq 1 ]; then
        printf " - ${NC} $1 \n"
    fi
    if [ "$#" -eq 2 ]; then
        COLOUR=$1
        printf " - ${!COLOUR} $2 \n"
    fi
}

# Must have destination

if [ "$#" -ne 1 ]; then
    cli_text "RED" "Usage: $0 URL" >&2
    exit 1
fi

URL=$1
URL1="${URL#http://}"
URL2="${URL1#https://}"
FILE="${URL2#www.}".html


run_lighthouse()
{
    CMD="`${RUN} $URL --output-path=${WWW}${FILE} --chrome-flags=\"${CHROMEFLAGS}\"`"
    echo "/bin/${CMD}"
    /bin/${CMD}
}

run_lighthouse