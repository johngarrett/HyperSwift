import Foundation

open class SimpleHTMLComponent: HTMLComponent {
    public let text: String!
    public init(_ text: String, attributes: [String:String] = ["":""], cls: String = "", _ tag: HTMLTag) {
        self.text = text
        super.init(tag, cls: cls, attributes: attributes)
    }
    
    override public func render() -> String {
        self.tag.opening(attributes) + self.text + self.tag.closing()
    }
}

public class Paragraph: SimpleHTMLComponent {
    public init(cls: String = "", _ text: String) {
        super.init(text, cls: cls, .paragraph)
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

public class Link: SimpleHTMLComponent {
    public init( _ text: String, cls: String = "", href: String) {
        super.init(text, attributes: ["href": href], cls: cls, .a)
    }
}

public class RawHTML: HTMLElement {
    public var tag: HTMLTag = .empty
    public var className: String = ""
    public var attributes: [String : String] = ["":""]
    public var childComponents: [HTMLElement]? = nil
    public let rawString: String
    
    public func render() -> String {
        self.rawString
    }
    
    public init(_ rawString: String) {
        self.rawString = rawString
    }
}
