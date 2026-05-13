struct UnionFind {
    private var parents: [Int]
    private var componentSizes: [Int]

    init(count: Int) {
        self.parents = Array(0..<count)
        self.componentSizes = Array(repeating: 1, count: count)
    }

    mutating func root(of value: Int) -> Int {
        if parents[value] == value {
            return value
        }

        parents[value] = root(of: parents[value])
        return parents[value]
    }

    mutating func union(_ lhs: Int, _ rhs: Int) {
        var lhsRoot = root(of: lhs)
        var rhsRoot = root(of: rhs)

        guard lhsRoot != rhsRoot else {
            return
        }

        if componentSizes[lhsRoot] < componentSizes[rhsRoot] {
            swap(&lhsRoot, &rhsRoot)
        }

        parents[rhsRoot] = lhsRoot
        componentSizes[lhsRoot] += componentSizes[rhsRoot]
    }

    mutating func areConnected(_ lhs: Int, _ rhs: Int) -> Bool {
        root(of: lhs) == root(of: rhs)
    }

    mutating func size(of value: Int) -> Int {
        componentSizes[root(of: value)]
    }
}
