import Foundation

// Current AtCoder / OJ workspace.
// Write the current OJ solution here.
// For submission, copy this file content directly into the judge.
// Prefer a single-file implementation for OJ submissions.
// Avoid excessive abstraction; keep parsing, solve logic, and output easy to inspect.

func solve() {
    let data = FileHandle.standardInput.readDataToEndOfFile()
    let input = String(decoding: data, as: UTF8.self)
    let output = solve(input: input)

    if !output.isEmpty {
        print(output)
    }
}

func solve(input: String) -> String {
    var scanner = OJScanner(input: input)

    guard let value = scanner.readInt() else {
        return ""
    }

    return String(value * 2)
}

private struct OJScanner {
    private var bytes: [UInt8]
    private var currentIndex: Int = 0

    init(input: String) {
        self.bytes = Array(input.utf8) + [0]
    }

    mutating func readInt() -> Int? {
        guard let token = readString() else {
            return nil
        }

        return Int(token)
    }

    private mutating func readString() -> String? {
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
