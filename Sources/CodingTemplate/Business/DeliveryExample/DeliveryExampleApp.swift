import Foundation

struct DeliveryExampleApp {
    func run() {
        do {
            let input = FileHandle.standardInput.readDataToEndOfFile()
            let output = try run(input: String(decoding: input, as: UTF8.self))

            if !output.isEmpty {
                print(output)
            }
        } catch {
            writeError(error)
            Foundation.exit(1)
        }
    }

    func run(input: String) throws -> String {
        var scanner = FastScanner(input: input)
        let requests = try DeliveryQueryParser.parseRequests(using: &scanner)
        let processedIdentifiers = DeliveryService().process(requests)
        return processedIdentifiers.joined(separator: "\n")
    }

    private func writeError(_ error: Error) {
        let message = "Error: \(error)\n"
        if let data = message.data(using: .utf8) {
            FileHandle.standardError.write(data)
        }
    }
}
