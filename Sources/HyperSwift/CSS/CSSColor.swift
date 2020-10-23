import Foundation

public struct CSSColor: CustomStringConvertible {
    public let description: String
    public init(_ hexCode: String) {
       description = hexCode
    }
    
    public init(r: Int, g: Int, b: Int, a: Double = 0) {
        description = "rgba(\(r), \(g), \(b), \(a))"
    }
}
