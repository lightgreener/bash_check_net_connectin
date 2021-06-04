# check the status of connecting to a certain website

if return 200 means good
if return 400 means webpage problem
if return 500 means server problem


commands
# remember this command it will return number
curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" http://www.duckduckgo.com

