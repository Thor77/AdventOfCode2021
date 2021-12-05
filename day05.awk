BEGIN {
    FS=" -> "
}
{
    split($1, linestart, ",")
    split($2, lineend, ",")
    # 1 = x, 2 = y

    if (linestart[1] == lineend[1]) {
        # draw vertical line
        if (linestart[2] > lineend[2]) {
            start = lineend[2] 
            end = linestart[2] 
        } else {
            start = linestart[2] 
            end = lineend[2] 
        }
        for (i = start; i <= end; i++) {
            field[i][linestart[1]]++
        }
    } else if (linestart[2] == lineend[2]) {
        # draw horizontal line
        if (linestart[1] > lineend[1]) {
            start = lineend[1] 
            end = linestart[1] 
        } else {
            start = linestart[1] 
            end = lineend[1] 
        }
        for (i = start; i <= end; i++) {
            field[linestart[2]][i]++
        }
    }
    if (part2 == 1) { 
        if (linestart[1] != lineend[1] && linestart[2] != lineend[2]) {
            # draw diagonal line
            if (linestart[1] == linestart[2] && lineend[1] == lineend[2]) {
                for (i = linestart[1]; i <= lineend[1]; i++) {
                    field[i][i]++
                }
            } else {
                startx = linestart[1]
                endx = lineend[1]
                starty = linestart[2]
                endy = lineend[2]
                x = startx
                y = starty
                while (1) {
                    field[y][x]++
                    if (x == endx && y == endy) {
                        break
                    }
                    if (startx < endx) {
                        # left to right
                        x++
                    } else {
                        # right to left
                        x--
                    }
                    if (starty < endy) {
                        # top to bottom
                        y++
                    } else {
                        # bottom to top
                        y--
                    }
                }
            }
        }
    }
}
END {
    # count places with two overlapping lines
    overlaps = 0
    for (rowidx in field) {
        for (colidx in field[rowidx]) {
            if (field[rowidx][colidx] >= 2) {
                overlaps++
            }
        }
    }
    print overlaps
}
