import Foundation

public struct JJCommandRunner: Sendable {
    public let repoPath: String

    public init(repoPath: String = ".") {
        self.repoPath = repoPath
    }

    public func run(_ arguments: [String]) async throws -> String {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = ["jj", "--repository", repoPath] + arguments

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8) else {
            throw JJError.invalidOutput
        }

        guard process.terminationStatus == 0 else {
            throw JJError.commandFailed(status: process.terminationStatus, output: output)
        }

        return output
    }
}

public enum JJError: Error, Sendable {
    case commandFailed(status: Int32, output: String)
    case invalidOutput
}
