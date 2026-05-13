import Foundation

struct FastScanner {
    private var bytes: [UInt8]
    private var currentIndex: Int

    init(data: Data) {
        self.bytes = Array(data) + [0]
        self.currentIndex = 0
    }

    init(input: String) {
        self.init(data: Data(input.utf8))
    }

    mutating func readInt() -> Int? {
        guard let token = readString() else {
            return nil
        }

        return Int(token)
    }

    mutating func readString() -> String? {
        skipWhitespaces()

        guard currentIndex < bytes.count - 1 else {
            return nil
        }

        let startIndex = currentIndex
        while currentIndex < bytes.count - 1, !isWhitespace(bytes[currentIndex]) {
            currentIndex += 1
        }

        return String(decoding: bytes[startIndex..<currentIndex], as: UTF8.self)
    }

    private mutating func skipWhitespaces() {
        while currentIndex < bytes.count - 1, isWhitespace(bytes[currentIndex]) {
            currentIndex += 1
        }
    }

    private func isWhitespace(_ byte: UInt8) -> Bool {
        byte == 10 || byte == 13 || byte == 32 || byte == 9
    }
}
