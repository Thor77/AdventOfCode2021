function min_array(array) {
    min = -1
    for (i in array) {
        if (min == -1 || array[i] < min) {
            min = array[i]
        }
    }
    return min
}
{
    split($0, crabs, ",")
}
END {
    for (posidx in crabs) {
        targetpos = crabs[posidx]
        fuel = 0
        for (crabidx in crabs) {
            if (crabs[crabidx] > targetpos) {
                fuel += crabs[crabidx] - targetpos
            }  else if (crabs[crabidx] < targetpos) {
                fuel += targetpos - crabs[crabidx]
            }
        }
        fuel_required[targetpos] = fuel
    }
    print min_array(fuel_required)
}
