import Foundation

class Div: HTMLComponent {
    init(_ cls: String, _ attributes:[String: String] = ["": ""], children: [HTMLElement]? = nil) {
        super.init(.div, cls: cls, attributes: attributes, children)
    }
}

extension Div {
    convenience public init(_ cls: String, attributes:[String:String] = ["":""], @DivBuilder _ children: () -> [HTMLElement]) {
        self.init(cls, attributes, children: children())
    }
    convenience public init(_ cls: String, attributes:[String:String] = ["":""], @DivBuilder _ child: () -> HTMLElement) {
        self.init(cls, attributes, children: [child()])
    }
    
    convenience public init(_ cls: String = "", attributes:[String:String] = ["":""], @DivBuilder _ child: () -> String) {
        self.init(cls, attributes, children: [RawHTML(child())])
    }
}

@_functionBuilder
struct DivBuilder {
    static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}
