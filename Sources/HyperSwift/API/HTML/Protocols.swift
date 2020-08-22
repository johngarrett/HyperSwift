import Foundation

public protocol Displayable {
    func render() -> String
}

public protocol ComponentType {
    func render() -> HTMLComponent
}

public protocol HTMLPage: ComponentType {
    static var title: String { get set }
    static var href: String { get set }
}
