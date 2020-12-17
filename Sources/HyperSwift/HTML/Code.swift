import Foundation

public class Code: HTMLComponent {
    public init(_ text: String) {
        super.init(.code, children: [RawHTML(text)])
    }
    
    public init(cssClass: String?=nil, id: String?=nil, _ attributes:[String: String] = ["": ""], children: [HTMLElement] = []) {
        super.init(.code, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
    public init(cssClass: String?=nil, id: String?=nil, attributes:[String: String] = ["": ""], text: String) {
        super.init(.code, cssClass: cssClass, id: id, attributes: attributes, children: [RawHTML(text)])
    }
}

public extension Code {
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @CodeBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass: cssClass, id: id, attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @CodeBuilder _ child: () -> HTMLElement) {
        self.init(cssClass: cssClass, id: id, attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", id: String?=nil, attributes:[String:String] = ["":""], @CodeBuilder _ child: () -> String) {
        self.init(cssClass: cssClass, id: id, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct CodeBuilder {
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
