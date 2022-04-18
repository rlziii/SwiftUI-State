import SwiftUI

// MARK: - ViewModel

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

// MARK: - SomeOuterView

struct SomeOuterView: View {
    @StateObject private var viewModel = ViewModel()
    let logger: DebugLogger

    var body: some View {
        didUpdate()
        return VStack {
            Button("Toggle Inner View", action: viewModel.updateState)

            switch viewModel.state {
            case .noInnerView:
                EmptyView()
            case .withInnerView:
                SomeInnerView(viewModel: viewModel, logger: logger)
            }
        }
        .padding()
        .border(.red)
    }

    private func didUpdate() {
        logger.didUpdateView("SomeOuterView")
    }
}

// MARK: - SomeInnerView

struct SomeInnerView: View {
    @ObservedObject var viewModel: ViewModel
    let logger: DebugLogger

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
        logger.didUpdateView("SomeInnerView")
    }
}
