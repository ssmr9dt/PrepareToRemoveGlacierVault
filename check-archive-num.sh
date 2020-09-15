#!/bin/bash

for i in $(cat jobid.txt);
do
        VAULTNAME=$(echo $i | cut -d":" -f1);
        aws glacier describe-vault --account-id - --vault-name $VAULTNAME
done
