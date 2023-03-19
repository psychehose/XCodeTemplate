//___FILEHEADER___

import RIBs
import RxSwift

protocol ___VARIABLE_productName___Routing: ViewableRouting {
}

public protocol ___VARIABLE_productName___Presentable: Presentable {
  var listener: ___VARIABLE_productName___PresentableListener? { get set }
}

protocol ___VARIABLE_productName___Listener: AnyObject {
}

public final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable, ___VARIABLE_productName___PresentableListener {

  weak var router: ___VARIABLE_productName___Routing?
  weak var listener: ___VARIABLE_productName___Listener?

  public override init(presenter: ___VARIABLE_productName___Presentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }

  public override func didBecomeActive() {
    super.didBecomeActive()
  }

  public override func willResignActive() {
    super.willResignActive()
  }
}
