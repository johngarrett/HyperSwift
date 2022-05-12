import Foundation

public class Header: HTMLComponent {
    public init(_ style: HTMLTag = .h1, text: String, cssClass: String = "", attributes: [String: String] = ["":""]) {
        super.init(style, cssClass: cssClass, id: nil, attributes: attributes, children: [RawHTML(text)])
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

@resultBuilder
public struct HeaderBuilder {
    public static func buildBlock(_ text: String) -> String { text }
}
