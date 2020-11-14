import Foundation

open class HTMLComponent: HTMLElement {
    public var tag: HTMLTag
    public var cssClass: String
    public var id: String
    public var attributes: [String: String]
    public var childComponents: [HTMLElement]?
    public var styles: [CSSStyle] = []
    public var description: String {
        self.render()
    }

    open func render() -> String {
        tag.opening(attributes) + (childComponents?.map { $0.render() }.joined() ?? "") + tag.closing()
    }
    
    public init(_ tag: HTMLTag, cssClass: String="", id: String="", attributes: [String: String] = ["": ""], _ childComponents: [HTMLElement]? = nil) {
        self.tag = tag
        self.childComponents = childComponents
        self.cssClass = cssClass
        self.id = id
        self.attributes = attributes.merging(
            ["id": id, "class": cssClass],
            uniquingKeysWith: {
                    [$0, $1].filter { !$0.isEmpty }.joined(separator: " ")
            }
        )
    }
    
    public init(_ element: HTMLElement) {
        self.tag = element.tag
        self.cssClass = element.cssClass
        self.id = element.id
        self.attributes = element.attributes
        self.childComponents = element.childComponents
    }
}

public extension HTMLComponent {
    convenience init(
        _ tag: HTMLTag,
        cssClass: String="",
        id: String="",
        attributes: [String: String]=["":""],
        @HTMLComponentBuilder _ component: () -> HTMLElement
    ) {
        self.init(
            tag,
            cssClass: cssClass,
            id: id,
            attributes: attributes,
            [component()]
        )
    }
    
    convenience init(
        _ tag: HTMLTag,
        cssClass: String="",
        id: String="",
        attributes: [String: String]=["":""],
        @HTMLComponentBuilder _ components: () -> [HTMLElement]
    ) {
           self.init(
               tag,
               cssClass: cssClass,
               id: id,
               attributes: attributes,
               components()
           )
       }
    
    convenience init(
        _ tag: HTMLTag,
        cssClass: String="",
        id: String="",
        attributes: [String: String] = ["":""],
        @HTMLComponentBuilder _ component: () -> String
    ) {
        self.init(
            tag,
            cssClass: cssClass,
            id: id,
            attributes: attributes,
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
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: [String]) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
}

 extension HTMLComponent: Equatable {
    public static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.cssClass == rhs.cssClass
    }
}
