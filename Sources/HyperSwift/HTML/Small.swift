import Foundation

public class Small: HTMLComponent {
    public init(_ cssClass: String? = nil, id: String?=nil, attributes:[String: String] = ["": ""], children: [Displayable] = []) {
        super.init(.small, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Small {
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @SmallBuilder _ children: () -> [Displayable]) {
        self.init(cssClass, id: id, attributes: attributes, children: children())
    }
    convenience init(_ cssClass: String?=nil, id: String?=nil, attributes:[String:String] = ["":""], @SmallBuilder _ child: () -> Displayable) {
        self.init(cssClass, id: id, attributes: attributes, children: [child()])
    }
}

@resultBuilder
public struct SmallBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
}
