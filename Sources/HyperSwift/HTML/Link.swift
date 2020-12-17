import Foundation

public class Link: HTMLComponent {
    public init(_ cssClass: String?=nil, id: String?=nil, href: String, attributes:[String: String] = ["":""], children: [HTMLElement]) {
        super.init(
            .a,
            cssClass: cssClass,
            attributes: attributes
                .merging(
                    ["id": id ?? "", "href": href ?? ""],
                    uniquingKeysWith: {
                        [$0, $1].compactMap { $0 }.joined(separator: " ")
                    }),
            children: children
        )
    }
}

public extension Link {
    convenience init(_ cssClass: String?=nil, id: String?=nil, href:String, attributes:[String:String] = ["":""], @LinkBuilder _ children: () -> [HTMLElement]) {
        self.init(cssClass, id: id, href: href, attributes: attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, href:String, attributes:[String:String] = ["":""], @LinkBuilder _ child: () -> HTMLElement) {
        self.init(cssClass, id: id, href: href, attributes: attributes, children: [child()])
    }
    
    convenience init(_ cssClass: String?=nil, id: String?=nil, href:String, attributes:[String:String] = ["":""], @LinkBuilder _ child: () -> String) {
        self.init(cssClass, id: id, href: href, attributes: attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
public struct LinkBuilder {
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
