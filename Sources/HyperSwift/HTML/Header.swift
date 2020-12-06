import Foundation

public class Header: SimpleHTMLComponent {
    public init(_ style: HTMLTag = .h1, text: String, cssClass: String = "", attributes: [String: String] = ["":""]) {
        super.init(text, cssClass: cssClass, style)
        self.attributes["class"] = cssClass
    }
}

public extension Header {
     convenience init(
        _ style: HTMLTag = .h1,
        cssClass: String = "",
        attributes: [String: String] = ["":""],
        @HeaderBuilder _ text: () -> String
     ) {
        self.init(
            style,
            text: text(),
            cssClass: cssClass,
            attributes: attributes
        )
    }
}

@_functionBuilder
public struct HeaderBuilder {
    public static func buildBlock(_ text: String) -> String { text }
}
