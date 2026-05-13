struct PriorityQueue<Element> {
    private var elements: [Element] = []
    private let hasHigherPriority: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool) {
        self.hasHigherPriority = sort
    }

    var isEmpty: Bool {
        elements.isEmpty
    }

    var count: Int {
        elements.count
    }

    func peek() -> Element? {
        elements.first
    }

    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }

        guard elements.count > 1 else {
            return elements.removeLast()
        }

        let result = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        return result
    }

    private mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0, hasHigherPriority(elements[childIndex], elements[parentIndex]) {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }

    private mutating func siftDown(from index: Int) {
        var parentIndex = index

        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = leftChildIndex + 1
            var candidateIndex = parentIndex

            if leftChildIndex < elements.count,
               hasHigherPriority(elements[leftChildIndex], elements[candidateIndex]) {
                candidateIndex = leftChildIndex
            }

            if rightChildIndex < elements.count,
               hasHigherPriority(elements[rightChildIndex], elements[candidateIndex]) {
                candidateIndex = rightChildIndex
            }

            guard candidateIndex != parentIndex else {
                return
            }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }

    private func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        index * 2 + 1
    }
}
