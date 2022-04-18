import Combine
import SwiftUI

@main
struct Application: App {
    let logger = DebugLogger()

    var body: some Scene {
        WindowGroup {
            VStack {
                NavigationView {
                    List {
                        NavigationLink("With Nested State") {
                            OuterView(logger: logger)
                                .navigationTitle("With Nested State")
                        }

                        NavigationLink("Without Nested State") {
                            SomeOuterView(logger: logger)
                                .navigationTitle("Without Nested State")
                        }
                    }
                }
                Divider()
                DebugView(logger: logger)
            }
        }
    }
}
