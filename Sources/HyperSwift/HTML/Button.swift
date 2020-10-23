import Foundation

public class Button: HTMLComponent {
    public init(_ cssClass: String, _ attributes: [String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.button, cssClass: cssClass, attributes: attributes, children)
    }
}

public extension Button {
    convenience init(
        _ cssClass: String = "",
        onClick: String = "",
        attributes:[String:String] = ["":""],
        @ButtonBuilder _ children: () -> [HTMLElement]
    ) {
        var mutAttr = attributes
        if onClick.count != 0 {
            mutAttr["onClick"] = onClick
        }
        self.init(cssClass, mutAttr, children: children())
    }
    convenience init(_ cssClass: String="", onClick: String = "", attributes:[String:String] = ["":""], @ButtonBuilder _ child: () -> HTMLElement) {
        var mutAttr = attributes
        if onClick.count != 0 {
            mutAttr["onClick"] = onClick
        }
        self.init(cssClass, mutAttr, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", onClick: String = "", attributes:[String:String] = ["":""], @ButtonBuilder _ child: () -> String) {
        var mutAttr = attributes
        if onClick.count != 0 {
            mutAttr["onClick"] = onClick
        }
        self.init(cssClass, mutAttr, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct ButtonBuilder {
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
