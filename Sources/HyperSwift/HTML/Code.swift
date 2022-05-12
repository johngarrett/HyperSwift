import Foundation

public class Code: HTMLComponent {
    public init(_ text: String) {
        super.init(.code, children: [RawHTML(text)])
    }
    
    public init(cssClass: String?=nil, id: String?=nil, _ attributes:[String: String] = ["": ""], children: [Displayable] = []) {
        super.init(.code, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Code {
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @CodeBuilder _ children: () -> [Displayable]) {
        self.init(cssClass: cssClass, id: id, attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @CodeBuilder _ child: () -> Displayable) {
        self.init(cssClass: cssClass, id: id, attributes, children: [child()])
    }
}

@resultBuilder
public struct CodeBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
}
