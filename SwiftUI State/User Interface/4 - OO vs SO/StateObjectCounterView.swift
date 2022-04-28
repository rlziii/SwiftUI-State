import SwiftUI

struct StateObjectCounterView: View {
    @StateObject private var viewModel = CounterViewModel()

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

struct StateObjectCounterView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectCounterView()
    }
}
