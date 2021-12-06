function format_fish(fish) {
    result = ""
    for (fishidx in fish) {
        if (result == "") {
            result = fish[fishidx]
        } else {
            result = result "," fish[fishidx]
        }
    }
    return result
}
BEGIN {
    days = 80
}
{
    split($0, fish, ",")
    next_fishidx = length(fish) + 1
}
END {
    for (i = 0; i < days; i++) {
        for (fishidx in fish) {
            if (fish[fishidx] == 0) {
                fish[fishidx] = 6
                fish[next_fishidx] = 8
                next_fishidx++
            } else {
                fish[fishidx]--
            }
        }
        #printf "day %d: %s (%d)\n", i, format_fish(fish), length(fish)
    }
    print length(fish)
}
