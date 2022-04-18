import Combine
import SwiftUI

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                NavigationView {
                    List {
                        NavigationLink("With Nested State") {
                            OuterView()
                                .navigationTitle("With Nested State")
                                .onDisappear { Logger.logAction(.clearLogs) }
                        }

                        NavigationLink("Without Nested State") {
                            SomeOuterView()
                                .navigationTitle("Without Nested State")
                                .onDisappear { Logger.logAction(.clearLogs) }
                        }
                    }
                }
                Divider()
                DebugView()
            }
        }
    }
}
