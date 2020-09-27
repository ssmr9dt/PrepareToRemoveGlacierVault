#!/bin/bash

num=$(./number-of-remain.sh <VaultName>)

curl -o /dev/null -s -X POST -H "Content-Type: application/json" -d '{"value1":"'$num'"}' https://maker.ifttt.com/trigger/<Trigger>
