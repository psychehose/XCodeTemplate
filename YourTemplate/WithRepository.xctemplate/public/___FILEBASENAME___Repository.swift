import Foundation
import RxSwift

public enum ___VARIABLE_productName___RepositoryEvent {
  case updateSections([___VARIABLE_productName___.DataSource.SECTION])
  case load(on: Bool)
  case showToast(String)
}

public protocol ___VARIABLE_productName___RepositoryType {
  var event: PublishSubject<___VARIABLE_productName___RepositoryEvent> { get }

  func fetch()
}

public final class ___VARIABLE_productName___Repository: ___VARIABLE_productName___RepositoryType {
  // MARK: PORT

  public var event = PublishSubject<___VARIABLE_productName___RepositoryEvent>()
  public var sections: [___VARIABLE_productName___.DataSource.SECTION] = []


  public init() {}

  public func fetch() {

    self.event.onNext(.load(on: true))

    self.sections = []

    self.event.onNext(.updateSections(self.sections))
    self.event.onNext(.load(on: false))
  }
}

extension ___VARIABLE_productName___Repository {
  // MARK: Custom
  private func checkSendErrorMessage(_ msg: String?) {
    self.event.onNext(.load(on: false))
    guard let msg = msg else {
      self.event.onNext(.showToast("알 수 없는 오류가 발생하였습니다."))
      return
    }
    self.event.onNext(.showToast(msg))
  }
}
