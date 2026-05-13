class Solution100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else { return p == nil && q == nil }
        
        if p.val != q.val { return false }
        
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
