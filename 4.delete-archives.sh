#!/bin/bash

counter=0

VAULTNAME=$1

for ARCHIVE in $(cat archivelist);
do
        echo delete $counter $ARCHIVE >> log
        aws glacier delete-archive --account-id - --vault-name $VAULTNAME --archive-id \"$ARCHIVE\" 2>/dev/null &
        counter=$((counter+1))
        if [ $(ps aux | grep aws | wc -l) -gt 20 ];
        then
                sleep 10
        fi
        sleep 0.1
done
