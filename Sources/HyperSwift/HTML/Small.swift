import Foundation

public class Small: HTMLComponent {
    public init(_ cssClass: String, id: String="", _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.small, cssClass: cssClass, id: id, attributes: attributes, children)
    }
}

public extension Small {
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @SmallBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass, id: id, attributes, children: children())
    }
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @SmallBuilder _ child: () -> HTMLElement) {
        self.init(cssClass, id: id, attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", id: String="", attributes:[String:String] = ["":""], @SmallBuilder _ child: () -> String) {
        self.init(cssClass, id: id, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct SmallBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: String...) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: [String]) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
}
