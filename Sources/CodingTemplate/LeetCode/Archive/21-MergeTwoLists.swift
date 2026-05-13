class Solution21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var first = list1
        var second = list2

        while let firstNode = first, let secondNode = second {
            if firstNode.val <= secondNode.val {
                tail?.next = firstNode
                first = firstNode.next
            } else {
                tail?.next = secondNode
                second = secondNode.next
            }

            tail = tail?.next
        }

        tail?.next = first ?? second
        return dummy.next
    }
}
