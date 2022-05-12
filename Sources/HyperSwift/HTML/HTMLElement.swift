import Foundation

public protocol HTMLElement: Displayable, CustomStringConvertible {
    var tag: HTMLTag { get set }
    var cssClass: String? { get set }
    var styles: [Style] { get set }
    var id: String? { get set }
    var attributes: [String: String] { get set }
    var children: [Displayable] { get set }
}
