# Swift Coding Template

A lightweight Swift Package template for local coding challenge practice.

It is designed for AtCoder-style stdin/stdout problems, LeetCode-style local debugging, and small business logic tasks similar to LINEヤフー or Mercari coding tests.

## Requirements

- Swift 6
- No UIKit
- No SwiftUI
- No third-party dependencies

## Run

Run the sample input:

```bash
swift run CodingTemplate < sample/input.txt
```

Or use the helper script:

```bash
./scripts/run.sh
```

Expected output:

```text
order-002
order-004
order-001
order-003
order-005
```

## Test

Run all tests:

```bash
swift test
```

Or use the helper script:

```bash
./scripts/test.sh
```

The tests use Swift Testing:

- `import Testing`
- `@Test`
- `#expect`

## Simulate AtCoder or OJ Input

Put input into `sample/input.txt`, then run:

```bash
swift run CodingTemplate < sample/input.txt
```

To compare against expected output:

```bash
swift run CodingTemplate < sample/input.txt | diff -u sample/expected.txt -
```

The current sample format is:

```text
N
PRIORITY IDENTIFIER
PRIORITY IDENTIFIER
...
```

`PRIORITY` supports:

- `NORMAL`
- `EXPRESS`

`EXPRESS` requests are processed before `NORMAL` requests. Requests with the same priority keep their input order.

## Project Structure

```text
Sources/CodingTemplate/
├── main.swift
├── OJ/
│   └── Scratch.swift
├── Business/
│   └── DeliveryExample/
│       ├── Models/
│       │   └── DeliveryRequest.swift
│       ├── Parser/
│       │   └── DeliveryQueryParser.swift
│       ├── Services/
│       │   └── DeliveryService.swift
│       └── DeliveryExampleApp.swift
├── LeetCode/
│   ├── Solution.swift
│   ├── Archive/
│   │   ├── MergeTwoLists.swift
│   │   └── Search81.swift
│   └── Support/
│       ├── LinkedListBuilder.swift
│       ├── ListNode.swift
│       ├── TreeBuilder.swift
│       └── TreeNode.swift
├── Parser/
│   └── FastScanner.swift
└── Utils/
    ├── BinarySearch.swift
    ├── PriorityQueue.swift
    ├── Queue.swift
    └── UnionFind.swift
```

`main.swift` stays thin and only selects the current local entry point:

```swift
// solve()
DeliveryExampleApp().run()
```

Uncomment `solve()` when you want to run the OJ scratch file locally. Use `DeliveryExampleApp().run()` when working on the business-style example. Reusable stdin parsing belongs in `Parser/`, reusable data structures belong in `Utils/`, and scenario-specific code stays under `OJ/`, `LeetCode/`, or `Business/`.

Tests follow the same split:

```text
Tests/CodingTemplateTests/
├── OJTests/
├── BusinessTests/
├── LeetCodeTests/
├── ParserTests/
└── UtilsTests/
```

## OJ Workflow

Use `Sources/CodingTemplate/OJ/Scratch.swift` as the current AtCoder or online judge workspace.

The intended loop is:

1. Write the current OJ solution in `Scratch.swift`.
2. Keep the implementation submission-friendly and mostly self-contained.
3. Add focused tests under `Tests/CodingTemplateTests/OJTests/` when useful.
4. Run local tests with `swift test`.
5. Submit by copying `Scratch.swift` into the judge.

`Scratch.swift` uses `func solve()` for the stdin/stdout entry point and also includes `solve(input:) -> String` for local testing without touching stdin/stdout. The example reads one integer and outputs its doubled value.

For OJ work, prefer clarity over abstraction. A small scanner, direct arrays, and a few copied utility types are better than a framework-style design.

## Business Challenge Workflow

Use `Sources/CodingTemplate/Business/DeliveryExample/` as the pattern for LINEヤフー / Mercari style implementation tasks.

The example keeps responsibilities split without adding extra target boundaries:

- `Models/DeliveryRequest.swift`: business data model.
- `Parser/DeliveryQueryParser.swift`: converts input tokens into models.
- `Services/DeliveryService.swift`: contains business rules.
- `DeliveryExampleApp.swift`: wires stdin, parser, service, and output.

Add tests under `Tests/CodingTemplateTests/BusinessTests/`. These tests should call parser/service/app APIs directly rather than depending on stdin/stdout.

## LeetCode Workflow

Use `Sources/CodingTemplate/LeetCode/Solution.swift` as the fixed workspace for the current LeetCode problem.

The intended loop is:

1. Write the current solution in `Solution.swift`.
2. Add focused tests under `Tests/CodingTemplateTests/LeetCodeTests/`.
3. Run local tests with `swift test`.
4. Submit by copying `Solution.swift` into LeetCode.
5. After finishing, copy the solution into `Sources/CodingTemplate/LeetCode/Archive/` with a clear problem name.

`Solution.swift` uses a plain `final class Solution` so the submission shape stays close to LeetCode's expected style. Keep the active problem there; archive files should use distinct names such as `Search81ArchiveSolution` to avoid conflicts with the active `Solution` class.

`Sources/CodingTemplate/LeetCode/Support/` contains local helpers for common LeetCode structures:

- `ListNode`
- `TreeNode`
- `makeList([1, 2, 3])`
- `listToArray(head)`
- `makeTree([1, 2, 3, nil, 4])`
- `treeToArray(root)`

These helpers are for local tests. When submitting to LeetCode, copy only the code that the platform needs. For many linked-list and tree problems, LeetCode already provides `ListNode` and `TreeNode`, so you may only need the body of `Solution.swift`.

## Utility Data Structures

Swift's standard library is solid, but a few coding-test data structures are either missing or inconvenient to use efficiently. This template keeps small, OJ-friendly versions in `Utils/`:

- `Queue`: head-index FIFO queue for BFS and task processing.
- `PriorityQueue`: binary heap with custom ordering, useful for Dijkstra, scheduling, and greedy selection.
- `UnionFind`: disjoint set union with path compression and union by size.
- `BinarySearch`: `lowerBound`, `upperBound`, and predicate-based first-match search.

These files are intentionally dependency-free so they can be copied into a single AtCoder `Main.swift` when needed.

## About Swift Collections

Apple's open-source `swift-collections` package provides useful production-quality containers such as `Deque`, `Heap`, `OrderedSet`, `OrderedDictionary`, `BitSet`, and `BitArray`.

For local business-style practice or take-home style exercises, it is reasonable to add `swift-collections` to `Package.swift` and use:

```swift
import Collections
```

For AtCoder or most online judges, keep the submitted solution dependency-free. These environments usually compile a single Swift source file and will not resolve SwiftPM package dependencies. In that case, copy only the utility types needed by the problem into the submitted file.

## Add a Model

Create a new file under a scenario-specific `Models/` folder, such as `Sources/CodingTemplate/Business/DeliveryExample/Models/`:

```swift
struct UserAction: Equatable {
    let userID: Int
    let action: String
}
```

Prefer small `struct` and `enum` types with names that describe the problem domain.

## Add a Service

Create a focused service under a scenario-specific `Services/` folder, such as `Sources/CodingTemplate/Business/DeliveryExample/Services/`:

```swift
struct UserActionService {
    func summarize(_ actions: [UserAction]) -> [String] {
        // Keep business logic here, not in main.swift.
    }
}
```

Avoid complex dependency injection, protocol-heavy abstractions, or framework-specific code unless the problem really needs it.

## Add a Test

Create a test file under the matching test folder, such as `Tests/CodingTemplateTests/BusinessTests/`:

```swift
import Testing
@testable import CodingTemplate

@Test func givenActions_whenSummarizing_thenReturnsExpectedResult() {
    let service = UserActionService()

    let result = service.summarize([])

    #expect(result == [])
}
```

Use Given-When-Then naming so the intent is clear when a test fails.

## Design Principles

- Lightweight: only the files needed for a maintainable challenge template.
- Readable: clear names and short functions over compact tricks.
- Testable: parser and service logic can be tested without running stdin.
- No over-engineering: no UIKit, no SwiftUI, no third-party dependencies, no protocol explosion.
- Practical: suitable for fast OJ iteration and small business implementation exercises.
