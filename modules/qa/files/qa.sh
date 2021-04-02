#!/bin/bash

# Import common utils.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/qa_utils.sh   
}
import_common

# Variables
SITEMAP_DEST="/tmp/sitemap_urls"


print_qa_usage()
{
    cli_header "QA Runner"
    cli_text "BLUE" "INPUTS" >&2
    cli_text "CYAN" "-u    = SINGLE URL. The URL to run tests against." >&2
    cli_text "CYAN" "-s    = SITEMAP URL. The URL of a Sitemap.xml file." >&2
    cli_text "GREY" "----------------------------------------" >&2
    cli_text "BLUE" "" >&2
    cli_text "BLUE" "TEST TYPES" >&2
    cli_text "CYAN" "-a    = Accessibility. Use the pa11y tool." >&2
    cli_text "CYAN" "-l    = lighthouse. Use the lighthouse tool." >&2
    cli_text "CYAN" "-b    = brokenlinks. Use the broken links (muffet) tool." >&2
    cli_text "BLUE" "" >&2
    cli_text "GREY" "----------------------------------------" >&2
    exit 1
}

run_url_to_file()
{
    echo $URL > $SITEMAP_DEST
}

run_sitemap_to_file()
{
    sitemap_urls $SITEMAP > $SITEMAP_DEST
}

run_module()
{
    while read -r LINE
    do
        CLEANURL=`echo "${LINE}" | sed -r 's/[\/|:]+/_/g'`
        CMD="${COMMAND} $LINE > ${WWW_DIR}/${CLEANURL}.txt"
        $CMD
    done < "${SITEMAP_DEST}"

    echo $CMD
}


# https://stackoverflow.com/questions/7069682/how-to-get-arguments-with-flags-in-bash/21128172
# https://google.github.io/styleguide/shellguide.html
while getopts 'lbu:s:' flag; do

    case "${flag}" in
        a) ACCESSIBILITY=true ;;
        l) LIGHTHOUSE=true ;;
        b) BROKENLINKS=true ;;
        u) URL="${OPTARG}" ;;
        s) SITEMAP="${OPTARG}" ;;
        *) print_qa_usage
    exit 1 ;;
    esac

done

# If NO parameters are given, print usage.
if [ "$#" -eq 0 ]; then
    print_qa_usage
fi

# If URL (-u) flag is being used send to /tmp/sitemap_urls
if [ ! -z $URL ]; then
    run_url_to_file
fi

# If SITEMAP (-s) flag is being used send to /tmp/sitemap_urls
if [ ! -z $SITEMAP ]; then
    run_sitemap_to_file
fi


if [ "$ACCESSIBILITY" = true ]; then
    COMMAND="qa_pa11y"
    WWW_DIR="/var/www/sites/qa/accessibility"
    run_module
fi

if [ "$LIGHTHOUSE" = true ]; then
    COMMAND="qa_lighthouse"
    WWW_DIR="/var/www/sites/qa/lighthouse"
    run_module
fi

if [ "$BROKENLINKS" = true ]; then
    COMMAND="qa_brokenlinks"
    WWW_DIR="/var/www/sites/qa/broken-links"
    run_module
fi

