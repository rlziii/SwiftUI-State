import Combine

class DebugLogger {
    private let viewNamesSubject = PassthroughSubject<String, Never>()
    var viewNames: AnyPublisher<String, Never> { viewNamesSubject.eraseToAnyPublisher() }

    func didUpdateView(_ viewName: String) {
        viewNamesSubject.send(viewName)
    }
}
