import Foundation
import Testing
@testable import JJMCPKit

@Suite("Change Model Tests")
struct ChangeTests {
    @Test("Change initializes with correct values")
    func testChangeInit() {
        let change = Change(
            changeId: "abc123",
            commitId: "def456",
            description: "Initial commit",
            author: "test@example.com"
        )
        #expect(change.changeId == "abc123")
        #expect(change.trailers.isEmpty)
    }

    @Test("Change with trailers")
    func testChangeWithTrailers() {
        let change = Change(
            changeId: "abc123",
            commitId: "def456",
            description: "Initial commit",
            author: "test@example.com",
            trailers: [Trailer(key: "Intent", value: "scaffold project")]
        )
        #expect(change.trailers.count == 1)
        #expect(change.trailers.first?.key == "Intent")
    }

    @Test("Change is Codable")
    func testChangeCodable() throws {
        let original = Change(
            changeId: "abc123",
            commitId: "def456",
            description: "test",
            author: "author",
            trailers: [Trailer(key: "k", value: "v")]
        )
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Change.self, from: data)
        #expect(original == decoded)
    }
}
