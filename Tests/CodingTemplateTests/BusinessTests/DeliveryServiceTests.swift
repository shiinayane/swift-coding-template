import Testing
@testable import CodingTemplate

class DeliveryServiceTests {
    @Test func givenMixedDeliveryRequests_whenProcessing_thenExpressRequestsComeFirst() {
        let requests = [
            DeliveryRequest(identifier: "normal-1", priority: .normal),
            DeliveryRequest(identifier: "express-1", priority: .express),
            DeliveryRequest(identifier: "normal-2", priority: .normal),
            DeliveryRequest(identifier: "express-2", priority: .express),
        ]
        let service = DeliveryService()

        let processedIdentifiers = service.process(requests)

        #expect(processedIdentifiers == [
            "express-1",
            "express-2",
            "normal-1",
            "normal-2",
        ])
    }

    @Test func givenOnlyNormalRequests_whenProcessing_thenInputOrderIsPreserved() {
        let requests = [
            DeliveryRequest(identifier: "normal-1", priority: .normal),
            DeliveryRequest(identifier: "normal-2", priority: .normal),
        ]
        let service = DeliveryService()

        let processedIdentifiers = service.process(requests)

        #expect(processedIdentifiers == ["normal-1", "normal-2"])
    }
}
