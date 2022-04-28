import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    @FocusState private var usernameFocused

    init(networkManager: NetworkManager) {
        _viewModel = .init(wrappedValue: .init(networkManager: networkManager))
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $viewModel.username)
                    .focused($usernameFocused)
                SecureField("Password", text: $viewModel.password)
            }

            Section {
                Button("Login") {
                    Task { try await viewModel.login() }
                }
                .keyboardShortcut(.defaultAction)
                .disabled(!viewModel.isValid)
            }
        }
        .navigationTitle("Login")
        .task(focusUsernameTextField)
        .alert(
            "Login Message",
            isPresented: $viewModel.isPresentingAlert,
            presenting: viewModel.alertMessage,
            actions: { _ in Button("OK", action: clearFields) },
            message: { Text($0) }
        )
    }

    @MainActor @Sendable
    private func focusUsernameTextField() async {
        try? await Task.sleep(nanoseconds: 600_000_000)
        usernameFocused = true
    }

    private func clearFields() {
        viewModel.clearFields()
        Task { await focusUsernameTextField() }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView(networkManager: NetworkManager())
        }
    }
}
