func makeTree(_ values: [Int?]) -> TreeNode? {
    guard let firstValue = values.first, let rootValue = firstValue else {
        return nil
    }

    let root = TreeNode(rootValue)
    var queue = Queue<TreeNode>()
    queue.enqueue(root)
    var index = 1

    while let node = queue.dequeue(), index < values.count {
        if let leftValue = values[index] {
            let leftNode = TreeNode(leftValue)
            node.left = leftNode
            queue.enqueue(leftNode)
        }
        index += 1

        guard index < values.count else {
            break
        }

        if let rightValue = values[index] {
            let rightNode = TreeNode(rightValue)
            node.right = rightNode
            queue.enqueue(rightNode)
        }
        index += 1
    }

    return root
}

func treeToArray(_ root: TreeNode?) -> [Int?] {
    guard let root else {
        return []
    }

    var values: [Int?] = []
    var queue = Queue<TreeNode?>()
    queue.enqueue(root)

    while let node = queue.dequeue() {
        guard let node else {
            values.append(nil)
            continue
        }

        values.append(node.val)
        queue.enqueue(node.left)
        queue.enqueue(node.right)
    }

    while values.last == .some(nil) {
        values.removeLast()
    }

    return values
}
