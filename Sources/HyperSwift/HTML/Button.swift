import Foundation

public class Button: HTMLComponent {
    public init(_ cssClass: String?=nil, id: String? = nil, _ attributes: [String: String] = ["": ""], children: [HTMLElement] = []) {
        super.init(.button, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Button {
    convenience init(
        _ cssClass: String = "",
        id: String = "",
        onClick: String? = nil,
        attributes:[String:String] = ["":""],
        @ButtonBuilder _ children: () -> [HTMLElement]
    ) {
        var mutAttr = attributes
        if let action = onClick {
            mutAttr["onClick"] = action
        }
        self.init(cssClass, id: id, mutAttr, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, onClick: String? = nil, attributes:[String:String] = ["":""], @ButtonBuilder _ child: () -> HTMLElement) {
        var mutAttr = attributes
        if let action = onClick {
            mutAttr["onClick"] = action
        }
        self.init(cssClass, id: id, mutAttr, children: [child()])
    }
    
    convenience init(_ cssClass: String = "", id: String = "", onClick: String? = nil, attributes:[String:String] = ["":""], @ButtonBuilder _ child: () -> String) {
        var mutAttr = attributes
        if let action = onClick {
            mutAttr["onClick"] = action
        }
        self.init(cssClass, id: id, mutAttr, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct ButtonBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: String...) -> HTMLElement {
        return HTMLComponent(.empty, children: components.map { RawHTML($0) })
    }
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        return HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [String]) -> HTMLElement {
        return HTMLComponent(.empty, children: components.map { RawHTML($0) })
    }
}
