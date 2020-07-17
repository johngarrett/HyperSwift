import Foundation

public struct CSSColor: CustomStringConvertible {
    public let description: String
    public init(_ hexCode: String) {
        self.description = hexCode
    }
    
    public init(r: Int, g: Int, b: Int, a: Double = 0) {
        self.description = "rgba(\(r), \(g), \(b), \(a))"
    }
}
