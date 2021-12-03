function bin2dec(input) {
    result = 0
    for (i in input) {
        result += (2^(length(input) - i)) * input[i]
    }
    return result
}
{
    split($0, digits, "")
    for (i in digits) {
        count[i][digits[i]]++
    }
}
END {
    for (i in count) {
        if (count[i][0] > count[i][1]) {
            gamma[i] = 0
            epsilon[i] = 1
        } else {
            gamma[i] = 1
            epsilon[i] = 0
        }
    }
    print bin2dec(gamma) * bin2dec(epsilon)
}
