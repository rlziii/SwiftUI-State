import Combine
import Foundation

extension Notification.Name {
    static let logPosted = Notification.Name("LogPosted")
    static let logAction = Notification.Name("LogAction")
}

// Namespace.
enum Logger {
    static func printLog(_ logString: String) {
        NotificationCenter.default.post(name: .logPosted, object: nil, userInfo: [LogKey.logString: logString])
    }

    static func logAction(_ logAction: LogAction) {
        NotificationCenter.default.post(name: .logAction, object: nil, userInfo: [LogKey.logAction: logAction])
    }

    enum LogKey {
        case logString
        case logAction
    }

    enum LogAction {
        case clearLogs
    }
}
