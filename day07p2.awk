function min_array(array) {
    min = -1
    for (i in array) {
        if (min == -1 || array[i] < min) {
            min = array[i]
        }
    }
    return min
}
function max_array(array) {
    max = 0
    for (i in array) {
        if (array[i] > max) {
            max = array[i]
        }
    }
    return max
}
{
    split($0, crabs, ",")
}
END {
    maxpos = max_array(crabs)
    for (targetpos = 0; targetpos <= maxpos; targetpos++) {
        fuel = 0
        for (crabidx in crabs) {
            diff = 0
            if (crabs[crabidx] > targetpos) {
                diff = crabs[crabidx] - targetpos
            }  else if (crabs[crabidx] < targetpos) {
                diff = targetpos - crabs[crabidx]
            }
            for (step = 1; step <= diff; step++) {
                fuel += step
            }
        }
        fuel_required[targetpos] = fuel
    }
    print min_array(fuel_required)
}
