import Combine
import SwiftUI

struct LogEntry {
    let viewName: String
    let highlighted: Bool
    let date: Date
}

class DebugViewModel: ObservableObject {
    @Published var logEntries = [LogEntry]()
    private let logger: DebugLogger
    private var cancellables = Set<AnyCancellable>()

    init(logger: DebugLogger) {
        self.logger = logger

        logger.viewNames
            .map { [unowned self] in
                let now = Date.now

                // Match log entry colors if they are very close in time.
                let highlighted: Bool = {
                    guard let lastLogEntry = logEntries.last else {
                        return false
                    }

                    if lastLogEntry.date.distance(to: now) < 0.1 {
                        return lastLogEntry.highlighted
                    } else {
                        return !lastLogEntry.highlighted
                    }
                }()

                return LogEntry(viewName: $0, highlighted: highlighted, date: now)
            }
            .sink { [unowned self] in logEntries.append($0) }
            .store(in: &cancellables)
    }
}

struct DebugView: View {
    @StateObject private var viewModel: DebugViewModel

    init(logger: DebugLogger) {
        self._viewModel = .init(wrappedValue: DebugViewModel(logger: logger))
    }

    var body: some View {
        VStack {
            Text("View Updates")
                .font(.title)

            List {
                ForEach(Array(zip(viewModel.logEntries.indices.reversed(), viewModel.logEntries.reversed())), id: \.0) { index, logEntry in
                    Text("\(index). \(logEntry.viewName)")
                        .listRowSeparator(.hidden)
                        .listRowBackground(logEntry.highlighted ? Color.gray.opacity(0.3) : nil)
                }
            }
            .listStyle(.plain)
        }
    }
}
