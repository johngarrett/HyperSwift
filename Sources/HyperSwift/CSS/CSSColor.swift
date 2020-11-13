import Foundation

public struct CSSColor: CustomStringConvertible {
    public var description: String
    
    public init(_ string: String) {
       description = string
    }
    
    public init(variable: String) {
        self = CSSColor("var(\(variable))")
    }
    
    public init(r: Int, g: Int, b: Int, a: Double = 1.0) {
        self = CSSColor("rgba(\(r), \(g), \(b), \(a))")
    }
}
