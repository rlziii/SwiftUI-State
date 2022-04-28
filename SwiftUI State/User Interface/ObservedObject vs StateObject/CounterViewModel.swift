import Combine

class CounterViewModel: ObservableObject {
    @Published private(set) var count = 0

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
