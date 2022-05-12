import Foundation

public class Link: HTMLComponent {
    public init(_ cssClass: String?=nil, id: String?=nil, href: String, attributes:[String: String] = ["":""], children: [Displayable]) {
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
    convenience init(_ cssClass: String?=nil, id: String?=nil, href:String, attributes:[String:String] = ["":""], @LinkBuilder _ children: () -> [Displayable]) {
        self.init(cssClass, id: id, href: href, attributes: attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, href:String, attributes:[String:String] = ["":""], @LinkBuilder _ child: () -> Displayable) {
        self.init(cssClass, id: id, href: href, attributes: attributes, children: [child()])
    }
}

@resultBuilder
public struct LinkBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        return HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        return HTMLComponent(.empty, children: components)
    }
}
