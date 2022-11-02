
import Foundation
import RxDataSources

extension ___VARIABLE_productName___ {
  struct DataSource {
    typealias Model = RxCollectionViewSectionedAnimatedDataSource<SECTION>

    enum SECTION {
      case one(title: String, items: [ITEM])
    }

    enum ITEMSTYLE: Equatable, Hashable {
      case one
    }

    struct ITEM: IdentifiableType, Equatable, Hashable {
      typealias Identity = String

      let style: ITEMSTYLE
      let identity: String = UUID().uuidString

      init(
        style: ITEMSTYLE
      ) {
        self.style = style
      }

      static func == (lhs: ITEM, rhs: ITEM) -> Bool {
        return lhs.identity == rhs.identity
      }
    }
  }
}

extension ___VARIABLE_productName___.DataSource.SECTION: AnimatableSectionModelType {
  typealias Identity = String

  typealias Item = ___VARIABLE_productName___.DataSource.ITEM

  var items: [Item] {
    switch self {
    case .one(_, let items):
      return items
    }
  }

  var title: String {
    switch self {
    case .one(let title, _):
      return title
    }
  }

  var identity: String {
    switch self {
    case .one(let title, _):
      return title
    }
  }

  init(original: ___VARIABLE_productName___.DataSource.SECTION, items: [___VARIABLE_productName___.DataSource.ITEM]) {
    switch original {
    case let .one(title, items):
      self = .one(title: title, items: items)
    }
  }
}