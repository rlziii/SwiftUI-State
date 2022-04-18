import SwiftUI

// MARK: - OuterViewModel

class OuterViewModel: ObservableObject {
    enum State {
        case noInnerView
        case withInnerView(InnerViewModel)
    }

    @Published var state = State.noInnerView

    func update() {
        switch state {
        case .noInnerView:
            state = .withInnerView(InnerViewModel())
        case .withInnerView:
            state = .noInnerView
        }
    }
}

// MARK: - OuterView

struct OuterView: View {
    @StateObject private var outerViewModel = OuterViewModel()
    let logger: DebugLogger

    var body: some View {
        didUpdate()
        return VStack {
            Button("Toggle Inner View", action: outerViewModel.update)

            switch outerViewModel.state {
            case .noInnerView:
                EmptyView()
            case .withInnerView(let innerViewModel):
                InnerView(innerViewModel: innerViewModel, logger: logger)
            }
        }
        .padding()
        .border(.red)
    }

    private func didUpdate() {
        logger.didUpdateView("OuterView")
    }
}

// MARK: - InnerViewModel

class InnerViewModel: ObservableObject {
    @Published var someBool = false

    func update() {
        someBool.toggle()
    }
}

// MARK: - InnerView

struct InnerView: View {
    @ObservedObject var innerViewModel: InnerViewModel
    let logger: DebugLogger

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
        logger.didUpdateView("InnerView")
    }
}
