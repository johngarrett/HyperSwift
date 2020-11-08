import Foundation

public class Link: HTMLComponent {
    public init(_ cssClass: String, id: String="", href: String, _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(
            .a,
            cssClass: cssClass,
            attributes: attributes
                .merging(
                    ["id": id, "href": href],
                    uniquingKeysWith: {
                        [$0, $1].filter { !$0.isEmpty }.joined(separator: " ")
                    }),
            children
        )
    }
}

public extension Link {
    convenience init(_ cssClass: String="", id: String="", href:String, attributes:[String:String] = ["":""], @LinkBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass, id: id, href: href, attributes, children: children())
    }
    convenience init(_ cssClass: String="", id: String="", href:String, attributes:[String:String] = ["":""], @LinkBuilder _ child: () -> HTMLElement) {
        self.init(cssClass, id: id, href: href, attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String="", id: String="", href:String, attributes:[String:String] = ["":""], @LinkBuilder _ child: () -> String) {
        self.init(cssClass, id: id, href: href, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct LinkBuilder {
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
