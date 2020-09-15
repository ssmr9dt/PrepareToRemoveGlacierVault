#!/bin/bash

for VAULTNAME in $(aws glacier list-vaults --account-id - | grep VaultName | cut -d"\"" -f4); do JOBID=$(aws glacier initiate-job --account-id - --vault-name $VAULTNAME --job-parameters '{"Type": "inventory-retrieval"}' | grep "jobId" | cut -d"\"" -f4); echo $VAULTNAME:$JOBID; done > jobid.txt
