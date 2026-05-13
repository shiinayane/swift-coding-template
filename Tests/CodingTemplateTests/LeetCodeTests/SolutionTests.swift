import Testing
@testable import CodingTemplate

class SolutionTests {
    @Test func test1() {
        let solution = Solution()
        
        let tree = makeTree([1,2,3,4,5])
        
        let result = solution.diameterOfBinaryTree(tree)
        
        #expect(result == 3)
    }
    
    @Test func test2() {
        let solution = Solution()
        
        let tree = makeTree([1,2])
        
        let result = solution.diameterOfBinaryTree(tree)
        
        #expect(result == 1)
    }
    
    @Test func test3() {
        let solution = Solution()
        
        let tree = makeTree([4,-7,-3,nil,nil,-9,-3,9,-7,-4,nil,6,nil,-6,-6,nil,nil,0,6,5,nil,9,nil,nil,-1,-4,nil,nil,nil,-2])
        
        let result = solution.diameterOfBinaryTree(tree)
        
        #expect(result == 8)
    }
}
