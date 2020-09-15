#!/bin/bash

VAULTNAME=$1

echo $(($(cat $VAULTNAME/archivelist | wc -l)-$(tail -n 1 $VAULTNAME/log | cut -d" " -f2)))
