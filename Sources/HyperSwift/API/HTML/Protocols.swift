import Foundation

public protocol Displayable {
    func render() -> String
}

public protocol ComponentType {
    func render() -> HTMLComponent
}

public protocol HTMLPage: ComponentType {
    var title: String { get set }
    var href: String { get set }
}
