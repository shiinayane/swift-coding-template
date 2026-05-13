class Solution543 {
    var result = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return result
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftDepth = dfs(root.left)
        let rightDepth = dfs(root.right)
        
        result = max(result, leftDepth + rightDepth)
        
        return max(leftDepth, rightDepth) + 1
    }
}
