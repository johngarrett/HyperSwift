import Foundation

public class HTMLComponent: HTMLElement {
    public var tag: HTMLTag
    public var className: String
    public var attributes: [String: String]
    public var childComponents: [HTMLElement]?

    public func render() -> String {
        tag.opening(attributes) + (childComponents?.map { $0.render() }.joined() ?? "") + tag.closing()
    }
    
    public init (_ tag: HTMLTag, cls: String = "", attributes: [String: String] = ["": ""], _ childComponents: [HTMLElement]? = nil) {
        self.tag = tag
        self.attributes = attributes
        self.childComponents = childComponents
        self.className = cls
        self.attributes["class"] = cls
        if cls != "" {
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
    convenience init(_ tag: HTMLTag? = nil, cls: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> HTMLElement) {
        self.init(
            tag ?? HTMLTag.empty,
            cls: cls ?? "",
            attributes: attributes ?? ["":""],
            [component()]
        )
    }
    
    convenience init(_ tag: HTMLTag, cls: String? = nil,  attributes: [String: String]? = nil, @HTMLComponentBuilder _ components: () -> [HTMLElement]) {
           self.init(
               tag,
               cls: cls ?? "",
               attributes: attributes ?? ["":""],
               components()
           )
       }
    
    convenience init(_ tag: HTMLTag, cls: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> String) {
        self.init(
            tag,
            cls: cls ?? "",
            attributes: attributes ?? ["":""],
            [RawHTML(component())]
        )
    }
}

@_functionBuilder
public struct HTMLComponentBuilder {
    static public func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}

extension HTMLComponent: Equatable {
    public static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.className == rhs.className
    }
}
