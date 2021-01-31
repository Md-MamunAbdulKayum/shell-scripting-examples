#!/bin/bash

CWD="$(dirname "$0")"

. ./perform_db_operation.sh

#Call the runQuery function from the perform_db_operation.sh file
tables=$(runQuery "show tables")

for table in "${tables[@]}"
do
   echo "$table"
done

#Get all the rowd from a table
all_vals=$(runQuery "select * from account")

for val in "${all_vals[@]}"
do
   echo "$val"
done