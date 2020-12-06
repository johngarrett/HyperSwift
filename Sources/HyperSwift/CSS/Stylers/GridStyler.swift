import Foundation

public extension HTMLComponent {
    func grid(_ value: String) -> HTMLComponent {
        add(style: CSSStyle("grid", value))
    }
    func gridArea(_ value: String) -> HTMLComponent {
        add(style: CSSStyle("grid-area", value))
    }
    func gridTemplate(_ value: String) -> HTMLComponent {
        add(style: CSSStyle("grid-template", value))
    }
    func placeItems(_ alignments: Alignment...) -> HTMLComponent {
        add(
            style: CSSStyle(
                "place-items",
                alignments
                    .map { String(describing: $0) }
                    .joined(separator: " ")
            )
        )
    }
}
