import Foundation

open class SimpleHTMLComponent: HTMLComponent {
    public let text: String!
    public init(_ text: String, attributes: [String:String] = ["":""], cssClass: String = "", _ tag: HTMLTag) {
        self.text = text
        super.init(tag, cssClass: cssClass, attributes: attributes)
    }
    
    override open func render() -> String {
        self.tag.opening(attributes) + self.text + self.tag.closing()
    }
}

public class Comment: SimpleHTMLComponent {
    public init(_ text: String) {
        super.init(text, .comment)
    }
}

public class Image: HTMLComponent {
    public init(url: String) {
        super.init(.img, attributes: ["src": url])
    }
}

public class RawHTML: HTMLElement {
    public var tag: HTMLTag = .empty
    public var cssClass: String = ""
    public var id: String = ""
    public var attributes: [String : String] = ["":""]
    public var childComponents: [HTMLElement]? = nil
    public let rawString: String
    public var description: String {
        self.render()
    }
    
    public func render() -> String {
        self.rawString
    }
    
    public init(_ rawString: String) {
        self.rawString = rawString
    }
}
