struct DeliveryQueryParser {
    static func parseRequests(using scanner: inout FastScanner) throws -> [DeliveryRequest] {
        guard let requestCount = scanner.readInt() else {
            throw QueryParserError.missingRequestCount
        }

        guard requestCount >= 0 else {
            throw QueryParserError.invalidRequestCount(requestCount)
        }

        var requests: [DeliveryRequest] = []
        requests.reserveCapacity(requestCount)

        for requestIndex in 0..<requestCount {
            let request = try parseRequest(using: &scanner, requestNumber: requestIndex + 1)
            requests.append(request)
        }

        return requests
    }

    private static func parseRequest(
        using scanner: inout FastScanner,
        requestNumber: Int
    ) throws -> DeliveryRequest {
        guard let priorityToken = scanner.readString() else {
            throw QueryParserError.missingPriority(requestNumber: requestNumber)
        }

        guard let priority = DeliveryRequest.Priority(rawValue: priorityToken) else {
            throw QueryParserError.invalidPriority(priorityToken, requestNumber: requestNumber)
        }

        guard let identifier = scanner.readString() else {
            throw QueryParserError.missingIdentifier(requestNumber: requestNumber)
        }

        return DeliveryRequest(identifier: identifier, priority: priority)
    }
}

enum QueryParserError: Error, Equatable, CustomStringConvertible {
    case missingRequestCount
    case invalidRequestCount(Int)
    case missingPriority(requestNumber: Int)
    case invalidPriority(String, requestNumber: Int)
    case missingIdentifier(requestNumber: Int)

    var description: String {
        switch self {
        case .missingRequestCount:
            return "Missing request count."
        case .invalidRequestCount(let count):
            return "Request count must be non-negative, got \(count)."
        case .missingPriority(let requestNumber):
            return "Missing priority for request \(requestNumber)."
        case .invalidPriority(let priority, let requestNumber):
            return "Invalid priority '\(priority)' for request \(requestNumber)."
        case .missingIdentifier(let requestNumber):
            return "Missing identifier for request \(requestNumber)."
        }
    }
}
