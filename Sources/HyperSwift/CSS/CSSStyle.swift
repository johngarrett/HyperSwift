import Foundation

public struct CSSStyle: CustomStringConvertible {
    public let key: String
    public let value: String
    public var description: String {
        "\(key):\(value);"
    }
    
    public init (_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }

    public init<T: CustomStringConvertible>(_ key: String, _ value: T) {
        self.init(key, String(describing: value))
    }
    public init<T: CustomStringConvertible>(_ key: String, values: T...) {
        self.init(key, values.map { String(describing: $0) }.joined(separator: " "))
    }
}
