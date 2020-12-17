import Foundation

public class Small: HTMLComponent {
    public init(_ cssClass: String? = nil, id: String?=nil, attributes:[String: String] = ["": ""], children: [HTMLElement] = []) {
        super.init(.small, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Small {
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @SmallBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass, id: id, attributes: attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @SmallBuilder _ child: () -> HTMLElement) {
        self.init(cssClass, id: id, attributes: attributes, children: [child()])
    }
    convenience init(_ cssClass: String = "", id: String?=nil, attributes:[String:String] = ["":""], @SmallBuilder _ child: () -> String) {
        self.init(cssClass, id: id, attributes: attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct SmallBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: String...) -> HTMLElement {
        HTMLComponent(.empty, children: components.map { RawHTML($0) })
    }
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [String]) -> HTMLElement {
        HTMLComponent(.empty, children: components.map { RawHTML($0) })
    }
}
