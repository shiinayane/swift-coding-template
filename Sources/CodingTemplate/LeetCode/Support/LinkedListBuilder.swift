func makeList(_ values: [Int]) -> ListNode? {
    let dummy = ListNode(0)
    var tail: ListNode? = dummy

    for value in values {
        tail?.next = ListNode(value)
        tail = tail?.next
    }

    return dummy.next
}

func listToArray(_ head: ListNode?) -> [Int] {
    var values: [Int] = []
    var current = head

    while let node = current {
        values.append(node.val)
        current = node.next
    }

    return values
}
