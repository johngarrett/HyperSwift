import Foundation

public class Div: HTMLComponent {
    public init(_ cls: String, _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.div, cls: cls, attributes: attributes, children)
    }
}

public extension Div {
    convenience init(_ cls: String="", attributes:[String:String] = ["":""], @DivBuilder _ children: () -> [HTMLElement]) {
        self.init(cls, attributes, children: children())
    }
    convenience init(_ cls: String="", attributes:[String:String] = ["":""], @DivBuilder _ child: () -> HTMLElement) {
        self.init(cls, attributes, children: [child()])
    }
    
    convenience init(_ cls: String = "", attributes:[String:String] = ["":""], @DivBuilder _ child: () -> String) {
        self.init(cls, attributes, children: [RawHTML(child())])
    }
}

 @_functionBuilder
public struct DivBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}
