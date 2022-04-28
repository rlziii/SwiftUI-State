import Combine
import SwiftUI

@main
struct Application: App {
    let networkManager = NetworkManager(cache: .init())

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView(networkManager: networkManager)
            }.navigationViewStyle(.stack)
        }
    }
}
