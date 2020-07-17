import Foundation

public protocol HTMLElement: Displayable {
     var tag: HTMLTag { get set }
    var className: String { get set }
    var attributes: [String: String] { get set }
    var childComponents: [HTMLElement]? { get set }
}
