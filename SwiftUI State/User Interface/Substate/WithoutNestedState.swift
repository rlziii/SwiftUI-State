import SwiftUI

// MARK: - Namespace

enum WithoutNestedState {}

// MARK: - ViewModel

extension WithoutNestedState {
    class ViewModel: ObservableObject {
        enum State {
            case noInnerView
            case withInnerView
        }

        @Published var state = State.noInnerView
        @Published var someBool = false

        func updateState() {
            switch state {
            case .noInnerView:
                state = .withInnerView
            case .withInnerView:
                state = .noInnerView
            }
        }

        func updateBool() {
            someBool.toggle()
        }
    }
}

// MARK: - OuterView

extension WithoutNestedState {
    struct OuterView: View {
        @StateObject private var viewModel = ViewModel()

        var body: some View {
            didUpdate()
            return VStack {
                Button("Toggle Inner View", action: viewModel.updateState)

                switch viewModel.state {
                case .noInnerView:
                    EmptyView()
                case .withInnerView:
                    InnerView(viewModel: viewModel)
                }
            }
            .padding()
            .border(.red)
        }

        private func didUpdate() {
            Logger.printLog("OuterView")
        }
    }
}

// MARK: - InnerView

extension WithoutNestedState {
    struct InnerView: View {
        @ObservedObject var viewModel: ViewModel

        var body: some View {
            didUpdate()
            return VStack {
                Button("Toggle Bool", action: viewModel.updateBool)
                Text(viewModel.someBool ? "True" : "False")
            }
            .padding()
            .border(.blue)
        }

        private func didUpdate() {
            Logger.printLog("InnerView")
        }
    }
}
