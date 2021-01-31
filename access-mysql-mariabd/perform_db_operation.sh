#!/bin/bash
CWD="$(dirname "$0")"

#Check if the config.yaml file exists
if [ ! -f $CWD/config.yaml ]; then
	echo "Error:: No configuration file is found at the '$CWD' directory."
	exit 1
fi

#Load the config.yaml
source $CWD/config.yaml

DB_NAME=$DB_NAME
DB_HOST=$DB_HOST
DB_USER=$DB_USER
DB_PASSWD=$DB_PASSWD

echo $DB_NAME

function checkConnectionParam {
if [ -z "$DB_HOST" ]; then
	echo "Error:: No database host is supplied."
	exit 1
fi

if [ -z "$DB_NAME" ]; then
	echo "Error:: No database name is supplied."
exit 1
fi

if [ -z "$DB_USER" ]; then
	echo "Error:: No database username is supplied."
exit 1
fi

if [ -z "$DB_PASSWD" ]; then
	echo "Error:: No database password is supplied."
exit 1
else
  #Converting base64 encripted password to the original password
  DB_PASS_ORG=`echo "$DB_PASSWD" | base64 --decode`
  #echo "$DB_PASS_ORG"   
fi

}

function runQuery {
  #checking the database connection param
  checkConnectionParam
  
  QUERY=$1
  if [ -z "$QUERY" ]; then
	echo "Error:: No database query string is supplied!"
  exit 1
  fi

  mysql -u"$DB_USER" -p"$DB_PASS_ORG" --database $DB_NAME -se "$QUERY" | while read -r result;
  do
  #Echo/Return the query results
    echo "$result"
  done
  
}