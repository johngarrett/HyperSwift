import Foundation
public enum HTMLTag: String {
    case html
    case head
    case comment = "!--"

    case title
    case h1, h2, h3, h4, h5, h6
    
    case a
    case em
    case code
    case small
    case bold = "b"

    case nav
    case body
    case link
    case script
    case paragraph = "p"
    case ordered_list = "ol"
    case unordered_list = "ul"

    case br
    case img
    case div
    case button
    case footer
    case input
    
    case empty

    public func opening(with attributes: [String: String], and styles: [Style]?) -> String {
        switch self {
        case .empty:
            return ""
        case .comment:
            return "<\(self.rawValue)"
        default:
            var attributes = attributes.filter {
                !$0.key.isEmpty && !$0.value.isEmpty
            }.sorted(by: {$0.key < $1.key }) // arbirarty sort to ensure uniformity
           
            if let styles = styles?.flattened() {
                attributes.append(contentsOf: ["style": styles])
            }

            let flatAttributes = attributes.map { key, value in
                key + "=\"\(value)\""
            }.joined(separator: " ")
            
            return "<\([self.rawValue, flatAttributes].filter { !$0.isEmpty }.joined(separator: " "))>"
        }
    }
    
    public func closing() -> String {
        switch self {
        case .empty, .img, .input:
            return ""
        case .comment:
            return "-->"
        default:
            return "</\(self.rawValue)>"
        }
    }
}

