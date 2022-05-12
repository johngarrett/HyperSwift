import Foundation

public class Comment: HTMLComponent {
    public init(_ text: String) {
        super.init(.comment, cssClass: nil, id: nil, attributes: [:], children: [RawHTML(text)])
    }
}

public class Image: HTMLComponent {
    public init(url: String) {
        super.init(.img, cssClass: nil, id: nil, attributes: ["src": url], children: [])
    }
}

public class RawHTML: HTMLElement {
    public var tag: HTMLTag = .empty
    public var cssClass: String? = nil
    public var id: String? = nil
    public var styles: [Style] = []
    public var attributes: [String : String] = ["":""]
    public var children: [Displayable] = []
    public var description: String
    public func render() -> String {
        description
    }
    
    public init(_ html: String) {
        self.description = html
    }
}
