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
combined="day${day}.awk"

if [ -f "$combined" ];
then
    p1args="-f $combined"
    p2args="-v part2=1 -f $combined"
else
    p1args="-f $p1"
    p2args="-f $p2"
fi

echo -n "Part 1: "
awk $p1args "$input_path"

if [ -f "$p2" ] || [ -f "$combined" ];
then
    echo -n "Part 2: "
    awk $p2args "$input_path"
fi
