#!/bin/bash

for i in $(cat jobid.txt); do VAULTNAME=$(echo $i | cut -d":" -f1); JOBID=$(echo $i | cut -d":" -f2); aws glacier describe-job --account-id - --vault-name $VAULTNAME --job-id $JOBID; done
