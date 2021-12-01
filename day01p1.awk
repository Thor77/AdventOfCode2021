BEGIN { increases = 0; prev = 0; }
prev == 0 { prev = $0; next; }
$0 > prev { increases++; }
{ prev = $0; }
END { print increases; }
