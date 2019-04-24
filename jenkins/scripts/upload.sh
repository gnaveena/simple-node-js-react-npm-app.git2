#!/bin/bash

#objectName=simple-node-js-react-npm-app11
file=/var/lib/jenkins/workspace/simple-node-js-react-npm-app11
bucket=kishore-jenkinsnpm
resource="/${bucket}"
contentType="application/simple-node-js-react-npm-app11"
dateValue=`date -R`
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
s3Key=AKIARHNW5J3LKHQU2H6H
s3Secret=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
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
curl -v -i -X PUT -T "${file}" \
          -H "Host: ${bucket}.s3.amazonaws.com" \
          -H "Date: ${dateValue}" \
          -H "Content-Type: ${contentType}" \
          -H "Authorization: AWS ${s3Key}:${signature}" \
           https://s3.amazonaws.com/${bucket}/${file}
