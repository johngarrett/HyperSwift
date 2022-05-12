import Foundation

public class HStack: HTMLComponent { }
public extension HStack {
    convenience init(
        _ cssClass: String? = nil,
        id: String?=nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @HStackBuilder _ children: () -> [Displayable]
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
        _ cssClass: String? = nil,
        id: String?=nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @HStackBuilder _ child: () -> Displayable
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

@resultBuilder
public struct HStackBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
}

public class VStack: HTMLComponent { }

public extension VStack {
    convenience init(
        _ cssClass: String? = nil,
        id: String?=nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @VStackBuilder _ children: () -> [Displayable]
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
        _ cssClass: String? = nil,
        id: String?=nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @VStackBuilder _ child: () -> Displayable
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

@resultBuilder
public struct VStackBuilder {
    public static func buildBlock(_ components: Displayable...) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
    public static func buildBlock(_ components: [Displayable]) -> Displayable {
        HTMLComponent(.empty, children: components)
    }
}
