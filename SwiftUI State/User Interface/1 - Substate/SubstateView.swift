import SwiftUI

struct SubstateView: View {
    var body: some View {
        VStack {
            NavigationView {
                List {
                    NavigationLink("Without Nested State") {
                        WithoutNestedState.OuterView()
                            .navigationTitle("Without Nested State")
                            .onDisappear { Logger.logAction(.clearLogs) }
                    }
                    NavigationLink("With Nested State") {
                        WithNestedState.OuterView()
                            .navigationTitle("With Nested State")
                            .onDisappear { Logger.logAction(.clearLogs) }
                    }
                }
            }

            Divider()
            NavigationLink(
                destination: { ColorsListView() },
                label: { Text("ColorsListView \(Image(systemName: "chevron.right"))") }
            )
            Divider()

            DebugView()
        }
        .navigationTitle("Substate")
    }
}

struct SubstateView_Previews: PreviewProvider {
    static var previews: some View {
        SubstateView()
    }
}
