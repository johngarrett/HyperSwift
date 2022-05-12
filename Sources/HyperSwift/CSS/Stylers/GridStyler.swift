import Foundation

public extension HTMLComponent {
    func grid(_ value: String) -> HTMLComponent {
        add(style: Style("grid", value))
    }
    func gridArea(_ value: String) -> HTMLComponent {
        add(style: Style("grid-area", value))
    }
    func gridTemplate(_ value: String) -> HTMLComponent {
        add(style: Style("grid-template", value))
    }
    func placeItems(_ alignments: Alignment...) -> HTMLComponent {
        add(
            style: Style(
                "place-items",
                alignments
                    .map { String(describing: $0) }
                    .joined(separator: " ")
            )
        )
    }
}
