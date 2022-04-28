import Combine
import SwiftUI

@main
struct Application: App {
    let networkManager = NetworkManager()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
            .environmentObject(networkManager)
            .navigationViewStyle(.stack)
        }
    }
}
