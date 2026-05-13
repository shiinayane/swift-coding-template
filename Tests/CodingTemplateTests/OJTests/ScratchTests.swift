import Testing
@testable import CodingTemplate

@Test func givenSingleInteger_whenSolvingScratchExample_thenPrintsDoubledValue() {
    let output = solve(input: "21\n")

    #expect(output == "42")
}

@Test func givenMissingInteger_whenSolvingScratchExample_thenPrintsNothing() {
    let output = solve(input: "")

    #expect(output == "")
}
