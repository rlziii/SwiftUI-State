import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            NavigationLink("Substate", destination: SubstateView())
            NavigationLink("ObservedObject vs StateObject", destination: SuperCoolButtonView())
            NavigationLink("State init", destination: EmptyView())
            NavigationLink("StateObject init", destination: EmptyView())
            NavigationLink("Infinite Redraws", destination: EmptyView())
            NavigationLink("Container Views", destination: LoginView(networkManager: NetworkManager()))
        }
        .navigationTitle("SwiftUI State")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
