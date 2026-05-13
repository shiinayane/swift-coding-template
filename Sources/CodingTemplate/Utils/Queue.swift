struct Queue<Element> {
    private var storage: [Element] = []
    private var headIndex: Int = 0

    var isEmpty: Bool {
        count == 0
    }

    var count: Int {
        storage.count - headIndex
    }

    mutating func enqueue(_ element: Element) {
        storage.append(element)
    }

    mutating func dequeue() -> Element? {
        guard headIndex < storage.count else {
            return nil
        }

        let element = storage[headIndex]
        headIndex += 1
        compactIfNeeded()
        return element
    }

    private mutating func compactIfNeeded() {
        guard headIndex > 32, headIndex * 2 > storage.count else {
            return
        }

        storage.removeFirst(headIndex)
        headIndex = 0
    }
}
