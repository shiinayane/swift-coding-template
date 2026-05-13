import Testing
@testable import CodingTemplate

@Test func givenSortedNumbers_whenSearchingTarget_thenReturnsIndex() {
    let solution = Solution()

    let index = solution.searchInsert([1, 3, 5, 6], 5)

    #expect(index == 2)
}

@Test func givenTwoSortedLists_whenMerging_thenReturnsSortedList() {
    let solution = Solution()
    let firstList = makeList([1, 2, 4])
    let secondList = makeList([1, 3, 4])

    let mergedList = solution.mergeTwoLists(firstList, secondList)

    #expect(listToArray(mergedList) == [1, 1, 2, 3, 4, 4])
}
