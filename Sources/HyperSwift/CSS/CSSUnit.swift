import Foundation

public struct CSSUnit: CustomStringConvertible {
    public enum UnitType: String {
        case percent = "%"
        case em
        case px
        case rem
    }
    public static var zero = CSSUnit(0, .px)
    public let description: String
    public init<T: FloatingPoint>(_ unit: T, _ type: UnitType = .px) {
        self.description = "\(unit)\(type.rawValue)"
    }
}
