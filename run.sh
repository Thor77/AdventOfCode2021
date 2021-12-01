#!/bin/bash
day="$1"

if [[ "$2" == "ex" ]];
then
    input_path="inputs/example$day"
else
    input_path="inputs/$day"
fi

if [ ! -f "$input_path" ]; then echo "$input_path doesn't exist"; exit 1; fi

p1="day${day}p1.awk"
p2="day${day}p2.awk"

echo -n "Part 1: "
awk -f "$p1" "$input_path"

if [ -f "$p2" ];
then
    echo -n "Part 2: "
    awk -f "$p2" "$input_path"
fi
