func lowerBound<T: Comparable>(in values: [T], for target: T) -> Int {
    firstIndex(in: 0..<values.count) { index in
        values[index] >= target
    }
}

func upperBound<T: Comparable>(in values: [T], for target: T) -> Int {
    firstIndex(in: 0..<values.count) { index in
        values[index] > target
    }
}

func firstIndex(in range: Range<Int>, where predicate: (Int) -> Bool) -> Int {
    var lowerBound = range.lowerBound
    var upperBound = range.upperBound

    while lowerBound < upperBound {
        let middle = lowerBound + (upperBound - lowerBound) / 2

        if predicate(middle) {
            upperBound = middle
        } else {
            lowerBound = middle + 1
        }
    }

    return lowerBound
}
