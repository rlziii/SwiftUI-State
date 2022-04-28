import SwiftUI

struct CounterLabelView: View {
    @State private var counterText: String

    init(count: Int) {
        _counterText = State(wrappedValue: "Count: \(count)")
    }

    var body: some View {
        Text(counterText)
    }
}

struct StateInitializationView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            CounterLabelView(count: count)

            HStack {
                Button {
                    count -= 1
                } label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                }

                Button {
                    count = 0
                } label: {
                    Image(systemName: "0.square")
                        .imageScale(.large)
                }

                Button {
                    count += 1
                } label: {
                    Image(systemName: "plus.square")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct StateInitializationView_Previews: PreviewProvider {
    static var previews: some View {
        StateInitializationView()
    }
}
