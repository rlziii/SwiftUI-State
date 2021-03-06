import SwiftUI

// MARK: Namespace
enum WithNestedState {}

// MARK: - OuterViewModel
extension WithNestedState {
    class OuterViewModel: ObservableObject {
        enum State {
            case noInnerView
            case withInnerView(InnerViewModel)
        }

        @Published var state = State.noInnerView

        func update() {
            switch state {
            case .noInnerView:
                withAnimation(.interactiveSpring()) {
                    state = .withInnerView(InnerViewModel())
                }
            case .withInnerView:
                withAnimation(.interactiveSpring()) {
                    state = .noInnerView
                }
            }
        }
    }
}

// MARK: - OuterView
extension WithNestedState {
    struct OuterView: View {
        @StateObject private var outerViewModel = OuterViewModel()

        var body: some View {
            didUpdate()
            return VStack {
                Button("Toggle Inner View", action: outerViewModel.update)

                switch outerViewModel.state {
                case .noInnerView:
                    EmptyView()
                case .withInnerView(let innerViewModel):
                    InnerView(innerViewModel: innerViewModel)
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

// MARK: - InnerViewModel
extension WithNestedState {
    class InnerViewModel: ObservableObject {
        @Published var someBool = false

        func update() {
            someBool.toggle()
        }
    }
}

// MARK: - InnerView
extension WithNestedState {
    struct InnerView: View {
        @ObservedObject var innerViewModel: InnerViewModel

        var body: some View {
            didUpdate()
            return VStack {
                Button("Toggle Bool", action: innerViewModel.update)
                Text(innerViewModel.someBool ? "True" : "False")
            }
            .padding()
            .border(.blue)
        }

        private func didUpdate() {
            Logger.printLog("InnerView")
        }
    }
}
