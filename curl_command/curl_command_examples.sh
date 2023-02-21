#!/bin/bash
#############################################################
# @Mamun Kayum                                              #
# Uncomment to use the curl commands                        #
#                                                           #
#############################################################

# Downloading a file
curl -o data.txt https://example.com/data.txt

# Uploading a file
curl -F "file=@/path/to/local/file.txt" https://example.com/upload

# Sending data using HTTP POST
curl -d "param1=value1&param2=value2" https://example.com/post

# Specifies the name of the file to which the data should be saved. For example, 
curl -o data.txt https://example.com/data.txt 

# Saves the output with the same name as the remote file. For example:
curl -O https://example.com/data.txt

# Sets a header for the request. For example:
curl -H "Authorization: Bearer TOKEN" https://example.com/api

# Sets the username and password for the request. For example:
curl -u username:password https://example.com/api 

