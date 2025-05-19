#!/bin/bash

# Environment variables
POSTMAN_API_KEY=$1
POSTMAN_COLLECTION_ID=$2
CHAIN=$3
SERVICE=$4
FILENAME=$5

# Convert OpenAPI to Postman Collection format
openapi2postmanv2 -s ${CHAIN}/${SERVICE}/${FILENAME} -o collection.json -O folderStrategy=Tags

# Wrap the collection in the required format
echo '{"collection":' > temp.json
cat collection.json >> temp.json
echo '}' >> temp.json

# Update the existing collection
curl -X PUT \
    -H "x-api-key: $POSTMAN_API_KEY" \
    -H "Content-Type: application/json" \
    -d @temp.json \
    "https://api.getpostman.com/collections/$POSTMAN_COLLECTION_ID" \
    -o response.json

# Check response
if [ $(cat response.json | grep -c "error") -gt 0 ]; then
  echo "Error updating collection:"
  cat response.json
  exit 1
else
  echo "Successfully updated collection"
fi
