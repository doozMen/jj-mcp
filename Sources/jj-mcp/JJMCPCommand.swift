import ArgumentParser
import JJMCPKit

@main
struct JJMCPCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "jj-mcp",
        abstract: "MCP server for jj version control"
    )

    @Option(name: .long, help: "Path to the jj repository")
    var repoPath: String = "."

    func run() throws {
        let runner = JJCommandRunner(repoPath: repoPath)
        print("jj-mcp server starting with repo: \(runner.repoPath)")
    }
}
