import Testing
@testable import CodingTemplate

@Test func givenValues_whenUsingPriorityQueue_thenDequeuesByPriority() {
    var queue = PriorityQueue<Int>(sort: <)

    queue.enqueue(5)
    queue.enqueue(1)
    queue.enqueue(3)

    #expect(queue.peek() == 1)
    #expect(queue.dequeue() == 1)
    #expect(queue.dequeue() == 3)
    #expect(queue.dequeue() == 5)
    #expect(queue.dequeue() == nil)
}

@Test func givenCustomValues_whenUsingPriorityQueue_thenUsesProvidedOrdering() {
    struct Job: Equatable {
        let name: String
        let priority: Int
    }

    var queue = PriorityQueue<Job> { lhs, rhs in
        lhs.priority > rhs.priority
    }

    queue.enqueue(Job(name: "normal", priority: 1))
    queue.enqueue(Job(name: "urgent", priority: 10))

    #expect(queue.dequeue()?.name == "urgent")
    #expect(queue.dequeue()?.name == "normal")
}

@Test func givenElements_whenUnionFindUnitesThem_thenConnectivityAndSizeAreUpdated() {
    var unionFind = UnionFind(count: 5)

    #expect(unionFind.areConnected(0, 2) == false)

    unionFind.union(0, 1)
    unionFind.union(1, 2)

    let zeroAndTwoAreConnected = unionFind.areConnected(0, 2)
    let zeroAndThreeAreConnected = unionFind.areConnected(0, 3)
    let componentSize = unionFind.size(of: 0)

    #expect(zeroAndTwoAreConnected)
    #expect(zeroAndThreeAreConnected == false)
    #expect(componentSize == 3)
}

@Test func givenSortedArray_whenFindingBounds_thenReturnsInsertionIndexes() {
    let values = [1, 2, 2, 2, 5, 8]

    #expect(lowerBound(in: values, for: 2) == 1)
    #expect(upperBound(in: values, for: 2) == 4)
    #expect(lowerBound(in: values, for: 4) == 4)
    #expect(upperBound(in: values, for: 8) == 6)
}

@Test func givenCustomPredicate_whenFindingFirstIndex_thenReturnsFirstMatchingIndex() {
    let answer = firstIndex(in: 0..<10) { value in
        value * value >= 30
    }

    #expect(answer == 6)
}
