import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""

    @Published var isPresentingAlert = false
    @Published var alertMessage: String?

    var isValid: Bool {
        let usernameIsValid = !username.isEmpty
        let passwordIsValid = password.count >= 5

        return usernameIsValid && passwordIsValid
    }

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    @MainActor @Sendable
    func login() async throws {
        let loginSuccessful = try await networkManager.login(username: username, password: password)
        alertMessage = loginSuccessful ? "Login successful!" : "Login failed :("
        isPresentingAlert = true
    }

    func clearFields() {
        username = ""
        password = ""
    }
}
