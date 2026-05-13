import Testing
@testable import CodingTemplate

@Test func givenDeliveryInput_whenRunningExampleApp_thenReturnsProcessedOutput() {
    let input = """
    4
    NORMAL order-1
    EXPRESS order-2
    NORMAL order-3
    EXPRESS order-4
    """
    let app = DeliveryExampleApp()

    let output = try! app.run(input: input)

    #expect(output == """
    order-2
    order-4
    order-1
    order-3
    """)
}

@Test func givenDeliveryInput_whenParsingQueries_thenBuildsRequests() throws {
    let input = """
    2
    NORMAL order-1
    EXPRESS order-2
    """
    var scanner = FastScanner(input: input)

    let requests = try DeliveryQueryParser.parseRequests(using: &scanner)

    #expect(requests == [
        DeliveryRequest(identifier: "order-1", priority: .normal),
        DeliveryRequest(identifier: "order-2", priority: .express),
    ])
}
