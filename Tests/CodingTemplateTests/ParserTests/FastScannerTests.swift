import Testing
@testable import CodingTemplate

@Test func givenWhitespaceSeparatedTokens_whenReadingValues_thenReturnsValuesInOrder() {
    var scanner = FastScanner(input: "  3\nNORMAL order-1\nEXPRESS order-2  ")

    #expect(scanner.readInt() == 3)
    #expect(scanner.readString() == "NORMAL")
    #expect(scanner.readString() == "order-1")
    #expect(scanner.readString() == "EXPRESS")
    #expect(scanner.readString() == "order-2")
}

@Test func givenNoRemainingInput_whenReadingToken_thenReturnsNil() {
    var scanner = FastScanner(input: "42")

    #expect(scanner.readInt() == 42)
    #expect(scanner.readString() == nil)
    #expect(scanner.readInt() == nil)
}
