
import Foundation
import RxDataSources

public extension ___VARIABLE_productName___ {
  struct DataSource {
    public typealias Model = RxCollectionViewSectionedAnimatedDataSource<SECTION>

    public enum SECTION {
      case one(title: String, items: [ITEM])
    }

    public enum ITEMSTYLE: Equatable, Hashable {
      case one
    }

    public struct ITEM: IdentifiableType, Equatable, Hashable {
      public typealias Identity = String

      public let style: ITEMSTYLE
      public let identity: String = UUID().uuidString

      public init(
        style: ITEMSTYLE
      ) {
        self.style = style
      }

      static public func == (lhs: ITEM, rhs: ITEM) -> Bool {
        return lhs.identity == rhs.identity
      }
    }
  }
}

extension ___VARIABLE_productName___.DataSource.SECTION: AnimatableSectionModelType {
  public typealias Identity = String

  public typealias Item = ___VARIABLE_productName___.DataSource.ITEM

  public var items: [Item] {
    switch self {
    case .one(_, let items):
      return items
    }
  }

  public var title: String {
    switch self {
    case .one(let title, _):
      return title
    }
  }

  public var identity: String {
    switch self {
    case .one(let title, _):
      return title
    }
  }

  public init(original: ___VARIABLE_productName___.DataSource.SECTION, items: [___VARIABLE_productName___.DataSource.ITEM]) {
    switch original {
    case let .one(title, items):
      self = .one(title: title, items: items)
    }
  }
}
