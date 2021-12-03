function bin2dec(input) {
    result = 0
    for (i in input) {
        result += (2^(length(input) - i)) * input[i]
    }
    return result
}
function join(input) {
    result = ""
    for (i in input) {
        result = result input[i]
    }
    return result
}
function copy_array(array, copy) {
    delete copy
    for (i in array) {
        if (isarray(array[i])) {
            copy[i][1]
            copy_array(array[i], copy[i])
        } else {
            copy[i] = array[i]
        }
    }
}
BEGIN {
}
{
    split($0, digits, "")
    for (i in digits) {
        inputs[NR][i] = digits[i]
    }
}
END {
    inputlength = length(inputs[1])
    copy_array(inputs, inputs2)
    for (pos = 1; pos < inputlength + 1; pos++) {
        for (inputidx in inputs) {
            count[inputs[inputidx][pos]]++
        }
        for (inputidx in inputs2) {
            count2[inputs2[inputidx][pos]]++
        }
        if (count[1] >= count[0]) {
            most = 1
        } else {
            most = 0
        }
        if (count2[0] <= count2[1]) {
            least = 0
        } else {
            least = 1
        }
        delete count
        delete count2
        for (i in inputs) {
            if (inputs[i][pos] != most) {
                delete inputs[i]
            }
        }
        for (i in inputs2) {
            if (inputs2[i][pos] != least) {
                delete inputs2[i]
            }
        }
        if (length(inputs) == 1) {
            for (i in inputs) {
                oxygen_generator = bin2dec(inputs[i])
            }
        }
        if (length(inputs2) == 1) {
            for (i in inputs2) {
                co2_scrubber = bin2dec(inputs2[i])
            }
        }
    }
    print oxygen_generator * co2_scrubber
}
