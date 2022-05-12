import Foundation

public class Div: HTMLComponent {
    public init(cssClass: String?=nil, id: String?=nil, attributes:[String: String] = [:], children: [Displayable] = []) {
        super.init(.div, cssClass: cssClass, id: id, attributes: attributes, children: children)
    }
}

public extension Div {
    convenience init(_ cssClass: String?=nil, id: String? = nil, attributes:[String:String] = [:], @DivBuilder _ children: () -> [Displayable]) {
        self.init(cssClass: cssClass, id: id, attributes: attributes, children: children())
    }
    @_disfavoredOverload
    convenience init(_ cssClass: String?=nil, id: String? = nil, attributes:[String:String] = [:], @DivBuilder _ child: () -> Displayable) {
        self.init(cssClass: cssClass, id: id, attributes: attributes, children: [child()])
    }
    
    @_disfavoredOverload
    convenience init(_ cssClass: String = "", id: String? = nil, attributes:[String:String] = [:], @DivBuilder _ child: () -> String) {
        self.init(cssClass: cssClass, id: id, attributes: attributes, children: [RawHTML(child())])
    }
}

@resultBuilder
public struct DivBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
}
