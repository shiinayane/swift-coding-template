struct DeliveryService {
    func process(_ requests: [DeliveryRequest]) -> [String] {
        var normalRequests = Queue<DeliveryRequest>()
        var expressRequests = Queue<DeliveryRequest>()

        for request in requests {
            switch request.priority {
            case .normal:
                normalRequests.enqueue(request)
            case .express:
                expressRequests.enqueue(request)
            }
        }

        return drain(&expressRequests) + drain(&normalRequests)
    }

    private func drain(_ queue: inout Queue<DeliveryRequest>) -> [String] {
        var identifiers: [String] = []

        while let request = queue.dequeue() {
            identifiers.append(request.identifier)
        }

        return identifiers
    }
}
