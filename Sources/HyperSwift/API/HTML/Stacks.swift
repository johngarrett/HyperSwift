import Foundation

public class HStack: HTMLComponent { }
public extension HStack {
    convenience init(
        _ cls: String? = nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @HStackBuilder _ children: () -> [HTMLElement]
    ) {
        self.init(
            Div(cls ?? "g_hstack_\(justification.rawValue)_\(alignment.rawValue)_\(wrap.rawValue)") {
                children()
            }
            .display(.flex)
            .justifyContent(justification)
            .alignItems(alignment)
            .flexDirection(.row)
            .flexWrap(wrap)
        )
    }
    convenience init(
        _ cls: String? = nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @HStackBuilder _ child: () -> HTMLElement
    ) {
        self.init(
            Div(cls ?? "g_hstack_\(justification.rawValue)_\(alignment.rawValue)_\(wrap.rawValue)") {
                [child()]
            }
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
}

public class VStack: HTMLComponent { }

public extension VStack {
    convenience init(
        _ cls: String? = nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @VStackBuilder _ children: () -> [HTMLElement]
    ) {
        self.init(
            Div(cls ?? "g_vstack_\(justification.rawValue)_\(alignment.rawValue)_\(wrap.rawValue)") {
                children()
            }
            .display(.flex)
            .justifyContent(justification)
            .alignItems(alignment)
            .flexDirection(.column)
            .flexWrap(wrap)
        )
    }
    convenience init(
        _ cls: String? = nil,
        justify justification: Justification = .flexStart,
        align alignment: Alignment = .stretch,
        wrap: FlexWrap = .nowrap,
        @VStackBuilder _ child: () -> HTMLElement
    ) {
        self.init(
            Div(cls ?? "g_vstack_\(justification.rawValue)_\(alignment.rawValue)_\(wrap.rawValue)") {
                [child()]
            }
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
}
