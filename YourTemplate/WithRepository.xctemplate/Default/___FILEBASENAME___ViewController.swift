import Foundation
import RxSwift
import RxCocoa
import UIKit
import ReactorKit

final class ___VARIABLE_productName___ViewController: UIViewController, ReactorKit.View {

  typealias Reactor = ___VARIABLE_productName___Reactor
  typealias DataSource = ___VARIABLE_productName___.DataSource.Model

  private lazy var collectionView: UICollectionView! = nil
  private lazy var indicatorView = IndicatorView(type: .lineSpinFadeLoader)
  //  private lazy var emptyView = MYEmptyView(image: R.Image.__)

  private var dataSource: DataSource!
  var disposeBag = DisposeBag()

  init(_ reactor: Reactor) {
    super.init(nibName: nil, bundle: nil)

    self.configureCollectionView()
    self.configureDataSource()
    self.configure()

    self.reactor = reactor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ___VARIABLE_productName___ViewController {
  // MARK: Layout
  private func configure() {
    self.view.backgroundColor = R.Color.backgroundColor

    self.configureSubviews()
    self.configureLayout()
    self.configureNavigationBar()
  }
  private func configureSubviews() {
    self.view.addSubview(self.collectionView)
  }

  private func configureLayout() {
    self.makeCollectionViewLayout()
  }

  private func makeCollectionViewLayout() {
    self.collectionView.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide)
      make.left.right.equalTo(self.view)
      make.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
  }

  private func configureNavigationBar() {
    self.navigationItem.leftItemsSupplementBackButton = true
    self.hidesBottomBarWhenPushed = true

    let titleView = UILabel().then {
      $0.text = "___VARIABLE_productName___"
      $0.textColor = R.Color.textColor
      $0.font = .scoreDream(type: .seventh, size: 16)
    }
    self.navigationItem.titleView = titleView
  }

  private func handlingIndicatorView(_ isOn: Bool) {
    if isOn {
      self.showIndicatorView()
    } else {
      self.hideIndicatorView()
    }
  }

  private func showIndicatorView() {
    self.view.addSubview(self.indicatorView)

    self.indicatorView.snp.makeConstraints { make in
      make.centerX.equalTo(self.view)
      make.centerY.equalTo(self.view).offset(-100)
    }

    self.indicatorView.startAnimating()
  }

  private func hideIndicatorView() {
    self.indicatorView.removeFromSuperview()
    self.indicatorView.stopAnimating()
  }

  //  private func showEmptyView() {
  //    self.view.addSubview(self.emptyView)
  //
  //    self.emptyView.snp.makeConstraints { make in
  //      make.top.equalTo(self.segmentView.snp.bottom).offset(24)
  //      make.height.equalTo(100)
  //      make.left.right.equalTo(self.view)
  //    }
  //  }
  //
  //  private func hideEmptyView() {
  //    self.emptyView.removeFromSuperview()
  //  }
  //
  //  private func handlingEmptyView(_ isExistItem: Bool) {
  //    if isExistItem {
  //      self.hideEmptyView()
  //    } else {
  //      self.showEmptyView()
  //    }
  //  }
}

extension ___VARIABLE_productName___ViewController {
  // MARK: CollectionView
  private func configureCollectionView() {
    self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.configureCollectionViewLayout())
    self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.collectionView.backgroundColor = R.Color.backgroundColor
    self.collectionView.showsVerticalScrollIndicator = false
    //    self.collectionView.register(NoticeCell.self, forCellWithReuseIdentifier: NoticeCell.reuseIdentifier)
  }

  private func configureCollectionViewLayout() -> UICollectionViewLayout {
    var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
    configuration.showsSeparators = false
    let layout = UICollectionViewCompositionalLayout.list(using: configuration)
    return layout
  }

  private func configureDataSource() {
    self.dataSource = DataSource(configureCell: { datasource, collectionView, indexPath, item in
      switch item.style {
      case .one:
        return UICollectionViewCell()
      }
    })
  }
}

extension ___VARIABLE_productName___ViewController {
  // MARK: Navigation

}
extension ___VARIABLE_productName___ViewController {
  // MARK: Bind
  public func bind(reactor: Reactor) {
    self.bindAction(reactor: reactor)
    self.bindState(reactor: reactor)
  }

  private func bindAction(reactor: Reactor) {
    rx.sentMessage(#selector(self.viewWillAppear(_:)))
      .mapToVoid()
      .map { Reactor.Action.viewWillAppear }
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)
  }

  private func bindState(reactor: Reactor) {
    reactor.state
      .map(\.sections)
      .bind(to: self.collectionView.rx.items(dataSource: self.dataSource))
      .disposed(by: self.disposeBag)

    //    reactor.state
    //      .map(\.sections.count)
    //      .map { $0 > 0 }
    //      .asDriverOnErrorJustComplete()
    //      .drive(onNext: self.handlingEmptyView)
    //      .disposed(by: self.disposeBag)

    reactor.state
      .map(\.load)
      .asDriverOnErrorJustComplete()
      .drive(onNext: self.handlingIndicatorView)
      .disposed(by: self.disposeBag)
  }
}
