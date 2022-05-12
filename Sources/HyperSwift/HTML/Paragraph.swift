import Foundation

public class Paragraph: HTMLComponent {
    public init(cssClass: String?=nil, _ text: String, id: String?=nil, attributes:[String:String] = ["":""]) {
        super.init(.paragraph, cssClass: cssClass, id: id, attributes: attributes, children: [RawHTML(text)])
    }
    public init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String], children:[Displayable] = []) {
        super.init(.paragraph, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Paragraph {
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @ParagraphBuilder _ children: () -> [Displayable]) {
        self.init(cssClass, id: id, attributes: attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @ParagraphBuilder _ child: () -> Displayable) {
        self.init(cssClass, id: id, attributes: attributes, children: [child()])
    }
}

@resultBuilder
public struct ParagraphBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        return HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        return HTMLComponent(.empty, children: components)
    }
}
