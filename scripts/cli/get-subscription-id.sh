#!/bin/bash
source jsonval.sh

json='az account list'
prop='id'
subId=`jsonval`

echo $subId
