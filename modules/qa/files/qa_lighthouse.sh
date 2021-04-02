#!/bin/bash

# Import common utils.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/qa_utils.sh   
}
import_common

# Variables
URL=$1
RUN="lighthouse"
WWW="/var/www/sites/qa/lighthouse/"
FLAGS="--only-audits [network-requests]"
CHROMEFLAGS="--no-sandbox --headless --disable-gpu"



generate_filename()
{
    NOHTTP="${URL#http://}"
    NOHTTPS="${NOHTTP#https://}"
    NOWWW="${NOHTTPS#www.}"
    FILENAME="${NOWWW}".html
}

clean_filename()
{
    # substitute all / and : for underscores. _
    CLEANFILENAME=`echo "${FILENAME}" | sed -r 's/[\/|:]+/_/g'`
}

run_lighthouse()
{
    echo ${RUN} $URL ${FLAGS} --output-path=${WWW}${CLEANFILENAME} --chrome-flags=\"${CHROMEFLAGS}\"
    CMD="`${RUN} $URL ${FLAGS} --output-path=${WWW}${CLEANFILENAME} --chrome-flags=\"${CHROMEFLAGS}\"`"
}

# Must have URL
if [ "$#" -lt 3 ]; then
    print_usage
fi

generate_filename
clean_filename
run_lighthouse