import Foundation

public class Paragraph: HTMLComponent {
    public init(_ text: String) {
        super.init(.paragraph, [RawHTML(text)])
    }
    
    public init(cssClass: String = "", id: String="", _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.paragraph, cssClass: cssClass, id: id, attributes: attributes, children)
    }
    public init(cssClass: String = "", id: String="", attributes:[String: String] = ["": ""], text: String) {
        super.init(.paragraph, cssClass: cssClass, id: id, attributes: attributes, [RawHTML(text)])
    }
}

public extension Paragraph {
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @ParagraphBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass: cssClass, id: id, attributes, children: children())
    }
    convenience init(_ cssClass: String="", id: String="", attributes:[String:String] = ["":""], @ParagraphBuilder _ child: () -> HTMLElement) {
        self.init(cssClass: cssClass, id: id, attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", id: String="", attributes:[String:String] = ["":""], @ParagraphBuilder _ child: () -> String) {
        self.init(cssClass: cssClass, id: id, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct ParagraphBuilder {
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
