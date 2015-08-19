#!/bin/bash

startd=$1
endd=$2

if [ "$startd" == "-h" ] ; then
    echo "Usage: top-accounts.sh [start date] [end date]"
    echo ""
    echo "Default for end date is current date."
    echo "Default for start date is 3 months prior to end date."
    exit 0
fi
if [ -z "$startd" ] ; then
    endd=`date +%Y-%m-%d`
elif [ -z "$endd" ] ; then
    endd=$startd
    startd=""
fi
if [ -z "$startd" ] ; then
    startd=`date --date "$endd -3 months -1 day" +%Y-%m-%d`
fi

sreport cluster AccountUtilizationByUser Start=$startd End=$endd  -t Hours | \
	sed -e 1,6d | \
	awk '$3 !~ /[A-Za-z]/ {print $2","$3}' | \
	sort -t , -k 2 -n -r
