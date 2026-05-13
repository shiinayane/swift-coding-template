struct DeliveryRequest: Equatable, Sendable {
    enum Priority: String, Sendable {
        case normal = "NORMAL"
        case express = "EXPRESS"
    }

    let identifier: String
    let priority: Priority
}
