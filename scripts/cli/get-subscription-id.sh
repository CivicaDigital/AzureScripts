#!/bin/bash

subId=$(az account list | jq '.[].id' | sed 's/[\"]//g')
echo $subId
