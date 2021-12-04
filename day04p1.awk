function sum_array(array) {
    result = 0
    for (i in array) {
        result += array[i]
    }
    return result
}
function sum_unmarked(board, marked) {
    result = 0
    for (rowidx in board) {
        for (colidx in board[rowidx]) {
            if (marked[rowidx][colidx] == 0) {
                result += board[rowidx][colidx]
            }
        }
    }
    return result
}
function contains(array, el) {
    for (i in array) {
        if (array[i] == el) {
            return 1
        }
    }
    return 0
}
/([[:digit:]],)+[[:digit:]]/ {
    split($0, sequence, ",")
    next
}
/[[:digit:]] / {
    split($0, digits, " ")
    for (i in digits) {
        boards[board][row][i] = digits[i]
        boards_marked[board][row][i] = 0
    }
    row++
    next
}
{
    board++
    row = 0
}
function join(input) {
    result = ""
    for (i in input) {
        result = result " " input[i]
    }
    return result
}
END {
    winneridx = 0
    for (i in sequence) {
        if (winneridx == length(boards)) {
            break
        }
        number = sequence[i]
        # mark number in all boards
        for (boardidx in boards) {
            if (contains(winner, boardidx)) {
                continue
            }
            for (rowidx in boards[boardidx]) {
                for (colidx in boards[boardidx][rowidx]) {
                    if (boards[boardidx][rowidx][colidx] == number) {
                        boards_marked[boardidx][rowidx][colidx] = 1
                        # check whether this board is winning now because of the row
                        if (sum_array(boards_marked[boardidx][rowidx]) == length(boards_marked[boardidx][rowidx])) {
                            print sum_unmarked(boards[boardidx], boards_marked[boardidx]) * number
                            winner[winneridx] = boardidx
                            winneridx++
                        }
                        colsum = 0
                        for (rowidx_ in boards[boardidx]) {
                            colsum += boards_marked[boardidx][rowidx_][colidx]
                        }
                        if (colsum == length(boards[boardidx][rowidx])) {
                            print sum_unmarked(boards[boardidx], boards_marked[boardidx]) * number
                            winner[winneridx] = boardidx
                            winneridx++
                        }
                    }
                }
            }
        }
    }
}
