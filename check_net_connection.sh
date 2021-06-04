#!/bin/env bash

# check the status of website reached.
#
#

URL_LIST="www.google.com www.duckduckgo.com"
for URL in $URL_LIST ; do	
	# set a avaiable to store how mant time of failure
	FAIL_COUNT=0
	# set a 3 times loop to reach website,
	for ((i=1;i<=3;i++)); do
		# set a available to receive httpcode
		HTTP_CODE=$(curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" $URL)
		# condition statement
		if [  $HTTP_CODE  -eq 200  ]; then
			echo "$URL is ok"
			break
		else 
			echo "retry $URL "
			FAIL_COUNT++
		fi
	done
	# if it fails 3 times
	if [ $FAIL_COUNT -eq 3  ];then
		echo "$URL access failure "
	fi

done



