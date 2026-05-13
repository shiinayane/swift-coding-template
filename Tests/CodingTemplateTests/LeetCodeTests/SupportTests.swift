import Testing
@testable import CodingTemplate

class SupportTests {
    @Test func givenValues_whenBuildingLinkedList_thenCanConvertBackToArray() {
        let head = makeList([1, 2, 3])

        let values = listToArray(head)

        #expect(values == [1, 2, 3])
    }

    @Test func givenEmptyValues_whenBuildingLinkedList_thenReturnsNil() {
        let head = makeList([])

        #expect(head == nil)
    }

    @Test func givenLevelOrderValues_whenBuildingTree_thenCanConvertBackToArray() {
        let root = makeTree([1, 2, 3, nil, 4])

        let values = treeToArray(root)

        #expect(values == [1, 2, 3, nil, 4])
    }

    @Test func givenEmptyLevelOrderValues_whenBuildingTree_thenReturnsNil() {
        let root = makeTree([])

        #expect(root == nil)
    }
}
