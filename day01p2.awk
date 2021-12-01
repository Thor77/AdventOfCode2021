BEGIN {
    increases = 0;
    prev = 0;
}
{
    arr[NR % 3] = $0;
}
NR >= 3 { 
    curr = arr[0] + arr[1] + arr[2];
    if (prev != 0 && curr > prev) {
        increases++;
    }
    prev = curr;
}
END {
    print increases;
}
