import Foundation

open class SimpleHTMLComponent: HTMLComponent {
    public let text: String!
    public init(_ text: String, attributes: [String:String] = ["":""], cssClass: String = "", _ tag: HTMLTag) {
        self.text = text
        super.init(tag, cssClass: cssClass, attributes: attributes)
    }
    
    override open func render() -> String {
        self.tag.opening(with: attributes, and: styles) + self.text + self.tag.closing()
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
    public var styles: [CSSStyle] = []
    public var attributes: [String : String] = ["":""]
    public var childComponents: [HTMLElement]? = nil
    public var description: String

    public func render() -> String {
        description
    }
    
    public init(_ html: String) {
        self.description = html
    }
}
