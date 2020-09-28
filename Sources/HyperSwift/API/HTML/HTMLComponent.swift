import Foundation

open class HTMLComponent: HTMLElement {
    public var tag: HTMLTag
    public var className: String
    public var attributes: [String: String]
    public var childComponents: [HTMLElement]?

    open func render() -> String {
        tag.opening(attributes) + (childComponents?.map { $0.render() }.joined() ?? "") + tag.closing()
    }
    
    public init(_ tag: HTMLTag, cssClass: String = "", attributes: [String: String] = ["": ""], _ childComponents: [HTMLElement]? = nil) {
        self.tag = tag
        self.attributes = attributes
        self.childComponents = childComponents
        self.className = cssClass
        self.attributes["class"] = cssClass
        if cssClass != "" {
            saveAttributes()
        }
    }
    
    public init(_ element: HTMLElement) {
        self.tag = element.tag
        self.className = element.className
        self.attributes = element.attributes
        self.childComponents = element.childComponents
    }
    
    private func saveAttributes() {
//        for attribute in attributes {
//            if self.tag != .div && self.tag != .empty {
//                CSSStyleSheet.add("\(attribute.key):\(attribute.value);", for: self.tag, parent: className)
//            } else {
//                CSSStyleSheet.add(style, for: className)
//            }
//        }
    }
}

public extension HTMLComponent {
    convenience init(_ tag: HTMLTag? = nil, cssClass: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> HTMLElement) {
        self.init(
            tag ?? HTMLTag.empty,
            cssClass: cssClass ?? "",
            attributes: attributes ?? ["":""],
            [component()]
        )
    }
    
    convenience init(_ tag: HTMLTag, cssClass: String? = nil,  attributes: [String: String]? = nil, @HTMLComponentBuilder _ components: () -> [HTMLElement]) {
           self.init(
               tag,
               cssClass: cssClass ?? "",
               attributes: attributes ?? ["":""],
               components()
           )
       }
    
    convenience init(_ tag: HTMLTag, cssClass: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> String) {
        self.init(
            tag,
            cssClass: cssClass ?? "",
            attributes: attributes ?? ["":""],
            [RawHTML(component())]
        )
    }
}

@_functionBuilder
public struct HTMLComponentBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: String...) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
}

 extension HTMLComponent: Equatable {
    public static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.className == rhs.className
    }
}
