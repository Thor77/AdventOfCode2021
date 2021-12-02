BEGIN {
    depth = 0;
    position = 0;
    aim = 0;
}
$1 == "forward" {
    position += $2;
    depth += aim * $2;
}
$1 == "down" { aim += $2; }
$1 == "up" { aim -= $2; }
END {
    print position * depth;
}
