import Foundation
public enum HTMLTag: String {
    case html
    case head
    case comment = "!--"

    case title
    case header1 = "h1", header2 = "h2", header3 = "h3", header4 = "h4", header5 = "h5", header6 = "h6"
    
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

    public func opening(_ attributes: [String: String]? = nil) -> String {
        switch self {
        case .empty:
            return ""
        case .comment:
            return "<\(self.rawValue)"
        default:
            if let attributes = attributes {
                let flattenedAttributes =
                    attributes.filter {
                        $0.key.count != 0 && $0.value.count != 0
                    }
                    .map {"\($0.key)=\"\($0.value)\""}
                    .joined(separator: " ")
                return flattenedAttributes != ""
                    ? "<\(self.rawValue) \(flattenedAttributes)>"
                    : "<\(self.rawValue)>"
            } else {
                return "<\(self.rawValue)>"
            }
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

