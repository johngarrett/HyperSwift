import Foundation

open class HTMLComponent: HTMLElement {
    public var tag: HTMLTag
    public var cssClass: String?
    public var id: String?
    public var attributes: [String: String] = ["":""]
    public var children: [Displayable] = []
    public var styles: [CSSStyle] = []
    public var description: String {
        self.render()
    }

    open func render() -> String {
        if let cssClass = cssClass {
            CSSStyleSheet.add(styles, to: cssClass)
        }

        return tag.opening(with: attributes, and: cssClass == nil ? styles: nil)
            + children.map { $0.render() }.joined()
            + tag.closing()
    }
    
    public init(
        _ tag: HTMLTag,
        cssClass: String?=nil,
        id: String?=nil,
        attributes: [String: String] = ["":""],
        children: [Displayable]
    ) {
        self.tag = tag
        self.children = children
        self.cssClass = cssClass
        self.id = id
        let p = attributes.merging(
            ["id": id, "class": cssClass].compactMap {
                guard let value = $0.value else {
                    return nil
                }
                return ($0.key, value)
            },
            uniquingKeysWith: {
                [$0, $1].filter { !$0.isEmpty }.joined(separator: " ")
            }
        )
        self.attributes = p
    }
    
    public init(_ element: HTMLElement) {
        self.tag = element.tag
        self.cssClass = element.cssClass
        self.id = element.id
        self.attributes = element.attributes
        self.children = element.children
        self.styles = element.styles
    }
}

public extension HTMLComponent {
    convenience init(
        _ tag: HTMLTag,
        cssClass: String?=nil,
        id: String?=nil,
        attributes: [String: String]=["":""],
        @HTMLComponentBuilder _ component: () -> Displayable
    ) {
        self.init(
            tag,
            cssClass: cssClass,
            id: id,
            attributes: attributes,
            children: [component()]
        )
    }
    
    convenience init(
        _ tag: HTMLTag,
        cssClass: String?=nil,
        id: String?=nil,
        attributes: [String: String]=["":""],
        @HTMLComponentBuilder _ components: () -> [Displayable]
    ) {
           self.init(
               tag,
               cssClass: cssClass,
               id: id,
               attributes: attributes,
            children: components()
           )
       }
    
    convenience init(
        _ tag: HTMLTag,
        cssClass: String?=nil,
        id: String?=nil,
        attributes: [String: String] = ["":""],
        @HTMLComponentBuilder _ component: () -> String
    ) {
        self.init(
            tag,
            cssClass: cssClass,
            id: id,
            attributes: attributes,
            children: [RawHTML(component())]
        )
    }
}

@resultBuilder
public struct HTMLComponentBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
}

 extension HTMLComponent: Equatable {
    public static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.cssClass == rhs.cssClass
            && lhs.id == rhs.id
    }
}
