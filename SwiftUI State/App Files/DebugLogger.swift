import Combine

class DebugLogger {
    private let viewNamesSubject = PassthroughSubject<String, Never>()
    var viewNames: AnyPublisher<String, Never> { viewNamesSubject.eraseToAnyPublisher() }

    private let actionsSubject = PassthroughSubject<Action, Never>()
    var actions: AnyPublisher<Action, Never> { actionsSubject.eraseToAnyPublisher() }

    func didUpdateView(_ viewName: String) {
        viewNamesSubject.send(viewName)
    }

    func sendAction(_ action: Action) {
        actionsSubject.send(action)
    }
}

extension DebugLogger {
    enum Action {
        case clearViewNames
    }
}
