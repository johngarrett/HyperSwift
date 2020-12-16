import Foundation

public class HStack: HTMLComponent { }
public extension HStack {
    convenience init(
        _ cssClass: String = "",
        id: String="",
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @HStackBuilder _ children: () -> [HTMLElement]
    ) {
        self.init(
            Div(cssClass: cssClass, id: id, children: children())
                .display(.flex)
                .justifyContent(justification)
                .alignItems(alignment)
                .flexDirection(.row)
                .flexWrap(wrap)
        )
    }
    convenience init(
        _ cssClass: String = "",
        id: String="",
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @HStackBuilder _ child: () -> HTMLElement
    ) {
        self.init(
            Div(cssClass: cssClass, id: id, children: [child()])
            .display(.flex)
            .justifyContent(justification)
            .alignItems(alignment)
            .flexDirection(.row)
            .flexWrap(wrap)
        )
    }
}

@_functionBuilder
public struct HStackBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: String...) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: [String]) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
}

public class VStack: HTMLComponent { }

public extension VStack {
    convenience init(
        _ cssClass: String = "",
        id: String="",
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @VStackBuilder _ children: () -> [HTMLElement]
    ) {
        self.init(
            Div(cssClass: cssClass, id: id, children: children())
                .display(.flex)
                .justifyContent(justification)
                .alignItems(alignment)
                .flexDirection(.column)
                .flexWrap(wrap)
        )
    }
    convenience init(
        _ cssClass: String = "",
        id: String="",
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @VStackBuilder _ child: () -> HTMLElement
    ) {
        self.init(
            Div(cssClass: cssClass, id: id, children: [child()])
                .display(.flex)
                .justifyContent(justification)
                .alignItems(alignment)
                .flexDirection(.column)
                .flexWrap(wrap)
        )
    }
}

@_functionBuilder
public struct VStackBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: String...) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
    public static func buildBlock(_ components: [HTMLElement]) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
    public static func buildBlock(_ components: [String]) -> HTMLElement {
        return HTMLComponent(.empty, components.map { RawHTML($0) })
    }
}
