import Foundation

public class Div: HTMLComponent {
    public init(_ cssClass: String, id: String="", _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.div, cssClass: cssClass, id: id, attributes: attributes, children)
    }
}

public extension Div {
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @DivBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass, id: id, attributes, children: children())
    }
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @DivBuilder _ child: () -> HTMLElement) {
        self.init(cssClass, id: id, attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", id: String="", attributes:[String:String] = ["":""], @DivBuilder _ child: () -> String) {
        self.init(cssClass, id: id, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct DivBuilder {
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
