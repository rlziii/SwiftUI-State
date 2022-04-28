import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            NavigationLink(
                "Substate",
                destination: SubstateView()
            )
            NavigationLink(
                "State Init",
                destination: StateInitializationView()
            )
            NavigationLink(
                "StateObject Init",
                destination: StateObjectInitializationView()
            )
            NavigationLink(
                "ObservedObject vs StateObject",
                destination: OOvsSOView()
            )
            NavigationLink(
                "Container Views",
                destination: LoginView(networkManager: NetworkManager())
            )
        }
        .navigationTitle("SwiftUI State")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
