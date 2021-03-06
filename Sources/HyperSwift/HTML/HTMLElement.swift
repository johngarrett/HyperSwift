import Foundation

public protocol HTMLElement: Displayable, CustomStringConvertible {
    var tag: HTMLTag { get set }
    var cssClass: String? { get set }
    var styles: [CSSStyle] { get set }
    var id: String? { get set }
    var attributes: [String: String] { get set }
    var children: [HTMLElement] { get set }
}
