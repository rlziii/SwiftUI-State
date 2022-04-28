import SwiftUI

class SOCounterViewModel: ObservableObject {
    @Published private(set) var count: Int

    init(startingCount: Int) {
        count = startingCount
    }

    func increment() {
        count += 1
    }

    func decrement() {
        count -= 1
    }

    func reset() {
        count = 0
    }
}

struct SOCounterView: View {
    @StateObject private var viewModel: SOCounterViewModel

    init(viewModel: SOCounterViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            HStack {
                Button(action: viewModel.decrement) {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                }

                Button(action: viewModel.reset) {
                    Image(systemName: "0.square")
                        .imageScale(.large)
                }

                Button(action: viewModel.increment) {
                    Image(systemName: "plus.square")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct StateObjectInitializationView: View {
    @State private var randomNumber = Int.random(in: 1...100)

    var body: some View {
        VStack(spacing: 20) {
            Button {
                randomNumber = Int.random(in: 1...100)
            } label: {
                Text("Random Number: \(randomNumber)")
            }

            SOCounterView(viewModel: .init(startingCount: randomNumber))
        }
    }
}

struct StateObjectInitializationView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectInitializationView()
    }
}
