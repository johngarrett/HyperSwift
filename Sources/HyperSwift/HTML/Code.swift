import Foundation

public class Code: HTMLComponent {
    public init(_ text: String) {
        super.init(.code, [RawHTML(text)])
    }
    
    public init(cssClass: String = "", id: String="", _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.code, cssClass: cssClass, id: id, attributes: attributes, children)
    }
    public init(cssClass: String = "", id: String="", attributes:[String: String] = ["": ""], text: String) {
        super.init(.code, cssClass: cssClass, id: id, attributes: attributes, [RawHTML(text)])
    }
}

public extension Code {
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @CodeBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass: cssClass, id: id, attributes, children: children())
    }
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @CodeBuilder _ child: () -> HTMLElement) {
        self.init(cssClass: cssClass, id: id, attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", id: String="", attributes:[String:String] = ["":""], @CodeBuilder _ child: () -> String) {
        self.init(cssClass: cssClass, id: id, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct CodeBuilder {
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
