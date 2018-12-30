#/usr/bin/env bash
# =============================================================================
#
#			  .-. .-. .-. .-. .-. .-. .-. .-.
#			  |  )|-  |-  |-' |   | | |  )|-
#			  `-' `-' `-' '   `-' `-' `-' `-'
#			      https://www.deepcode.ca
#
# Author: Jon Rasiko <jon@deepcode.ca>
# Presented to:  
# Date: 
# Version:
PROG_VERS="0.1.0"
#
# Description:
# ------------
PROG_DESC="Outputs a random user-agent string from a common browser, i.e. Edge, Firefox, Chrome or Safari."
#
#
# Release Notes:
# --------------
#	N/A
#
#
# References:
# -----------
#	N/A
#
#
# =============================================================================
#
usage() { 
    echo "Usage: $0 [count]" 1>&2
    exit 1 
}
UA_FILE="useragents.lst"

function dc_random_ua() {
   CNT="${1}"
   CWD=$(pwd)
   UA_FILE="${CWD}/${UA_FILE}"
   
   if [ ! -e "${UA_FILE}" ]; then
       echo "[-] User-agent file not found: ${UA_FILE}."
       exit 1
   fi

   if [ -z "${CNT}" ]; then
       CNT="1"
   fi

   UA=$(grep --ignore-case 'edge\|chrome\|mozilla|safari' "${UA_FILE}"  | shuf | head "-${CNT}")
   echo "${UA}"
}

if [ "${1}" == "--help" ]; then
    usage
fi

UA=$(dc_random_ua "${1}")
echo "${UA}"
exit 0


