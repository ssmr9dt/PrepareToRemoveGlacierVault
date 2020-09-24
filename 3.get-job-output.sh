#!/bin/bash

for i in $(cat jobid.txt);
do
        cd ~/
        VAULTNAME=$(echo $i | cut -d":" -f1);
        JOBID=$(echo $i | cut -d":" -f2);
        echo $VAULTNAME start
        mkdir $VAULTNAME;
        cd $VAULTNAME;
        aws glacier get-job-output --account-id - --vault-name $VAULTNAME --job-id $JOBID output.txt
        split -b 10MB output.txt
        for x in $(ls x*);
        do
                cat $x | sed -e "s/ArchiveId/\nArchiveId/g" | sed "s/,/,\n/g" | grep ArchiveId | cut -d"\"" -f3 >> archivelist
        done;
        rm x*
done
