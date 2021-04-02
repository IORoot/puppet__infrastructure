#!/bin/bash

# Import common utils.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/qa_utils.sh   
}
import_common

# Variables
URL=$1
RUN="muffet"
WWW="/var/www/sites/qa/broken-links"
FLAGS="--verbose --one-page-only"

clean_filename()
{
    # substitute all / and : for underscores. _
    CLEANFILENAME=`echo "${URL}" | sed -r 's/[\/|:]+/_/g'`
}

run_broken_link_checker()
{
    echo "${RUN} ${FLAGS} ${URL} > ${WWW}/${CLEANFILENAME}.txt"
    CMD="`${RUN} ${FLAGS} ${URL} > ${WWW}/${CLEANFILENAME}.txt`"
}

# Must have URL
if [ "$#" -lt 3 ]; then
    print_usage
fi

clean_filename
run_broken_link_checker