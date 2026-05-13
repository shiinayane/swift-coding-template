import Testing
@testable import CodingTemplate

@Test func given2DMatrix_whenDoingDFS_thenReturns2DList() {
    let solution = Solution()

    let result = solution.pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])

    #expect(result == [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]])
}

@Test func given2DMatrix_whenCountEqualsOne_thenReturnsOneIndex() {
    let solution = Solution()

    let result = solution.pacificAtlantic([[1]])

    #expect(result == [[0,0]])
}
