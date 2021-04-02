#!/bin/bash

if [ "$#" -ne 1 ]; then
    "Usage: $0 SITEMAPURL" >&2
    exit 1
fi

SITEMAP=$1

get_protocol()
{
    PROTO=$( echo $SITEMAP | sed 's/:\/\/.*//g')
}
get_protocol

get_domain()
{
    DOMAIN=$( echo $SITEMAP | awk -F[/:] '{print $4}')
}
get_domain

urls=$(curl -s $SITEMAP | grep "<loc>" | awk -F"<loc>" '{print $2} ' | awk -F"</loc>" '{print $1}')

for page in $urls 
do
    if [[ $page = '/'* ]]; then
        echo "${PROTO}://${DOMAIN}${page}"
    fi
done