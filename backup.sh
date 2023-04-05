#!/bin/bash

source_dir="/Users/osama/Documents/PycharmProjects/schoolProjects/BackUpScript"
target_dir="/Users/osama/Documents/PycharmProjects/schoolProjects/BackUpScript"

now=$(date +"%Y-%m-%d_%H-%M-%S")

if [[ $target_dir == *"@"* ]]; then
    ssh "${target_dir%%:*}" "mkdir -p ${target_dir#*:}"/$now
else
    mkdir -p $target_dir/$now  
fi    
    
if [[ $target_dir == *"@"* ]]; then
    rsync -av -e "ssh -T" --link-dest="${target_dir#*:}/latest" $source_dir "${target_dir%%:*}":"${target_dir#*:}"/$now
    ssh "${target_dir%%:*}" "ln -nsf ${target_dir#*:}/$now ${target_dir#*:}/latest"
else
    rsync -av --link-dest=$target_dir/latest $source_dir $target_dir/$now
    ln -nsf $target_dir/$now $target_dir/latest  
fi
