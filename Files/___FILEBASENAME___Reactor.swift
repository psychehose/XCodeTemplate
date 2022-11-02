import Foundation
import ReactorKit
import RxCocoa
import RxSwift

class ___VARIABLE_productName___Reactor: Reactor {

  enum Action {
    case viewWillAppear
  }

  enum Mutation {
    case updateSections([___VARIABLE_productName___.DataSource.SECTION])
    case load(_ on: Bool)
    case showToast(String)
  }

  struct State {
    var sections: [___VARIABLE_productName___.DataSource.SECTION] = []
    var load: Bool = false
    @Pulse var showToast: String?
  }

  let initialState: State
  let repository: ___VARIABLE_productName___RepositoryType
  var disposeBag = DisposeBag()

  init(repository: ___VARIABLE_productName___RepositoryType) {
    let state = State()
    self.repository = repository
    self.initialState = state
  }
}

extension ___VARIABLE_productName___Reactor {
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewWillAppear:
      return self.fetch()
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state

    switch mutation {
    case .updateSections(let sections):
      newState.sections = sections
    case .showToast(let msg):
      newState.showToast = msg
    case .load(let on):
      newState.load = on
    }

    return newState
  }
}

extension ___VARIABLE_productName___Reactor {
  // MARK: API
  private func fetch() -> Observable<Mutation> {

    self.repository.fetch()

    return .empty()
  }
}

extension ___VARIABLE_productName___Reactor {
  // MARK: Mutate
  func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
    let serviceMutation = self.repository.event.flatMap { event -> Observable<Mutation> in
      switch event {
      case .updateSections(let sections):
        return .just(.updateSections(sections))
      case .showToast(let msg):
        return .just(.showToast(msg))
      case .load(on: let on):
        return .just(.load(on))
      }
    }
    return Observable.merge(mutation, serviceMutation)
  }
}