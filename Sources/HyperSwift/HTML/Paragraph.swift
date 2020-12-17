import Foundation

public class Paragraph: HTMLComponent {
    public init(cssClass: String?=nil, _ text: String, id: String?=nil, attributes:[String:String] = ["":""]) {
        super.init(.paragraph, cssClass: cssClass, id: id, attributes: attributes, children: [RawHTML(text)])
    }
    public init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String], children:[HTMLElement] = []) {
        super.init(.paragraph, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Paragraph {
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @ParagraphBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass, id: id, attributes: attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @ParagraphBuilder _ child: () -> HTMLElement) {
        self.init(cssClass, id: id, attributes: attributes, children: [child()])
    }
}

@_functionBuilder
public struct ParagraphBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        return HTMLComponent(.empty, children: components)
    }
}
