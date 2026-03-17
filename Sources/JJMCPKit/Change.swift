import Foundation

public struct Change: Sendable, Codable, Equatable {
    public let changeId: String
    public let commitId: String
    public let description: String
    public let author: String
    public let trailers: [Trailer]

    public init(changeId: String, commitId: String, description: String, author: String, trailers: [Trailer] = []) {
        self.changeId = changeId
        self.commitId = commitId
        self.description = description
        self.author = author
        self.trailers = trailers
    }
}

public struct Trailer: Sendable, Codable, Equatable {
    public let key: String
    public let value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
