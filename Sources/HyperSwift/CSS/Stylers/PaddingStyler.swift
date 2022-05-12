import Foundation

public extension HTMLComponent {
    func padding<T: FloatingPoint>(
        top: T = 0, right: T = 0, bottom: T = 0, left: T = 0,
        _ type: CSSUnit.UnitType = .px
    ) -> HTMLComponent {
        add(
            style: Style(
                "padding",
                values:
                    CSSUnit(top, type),
                    CSSUnit(right, type),
                    CSSUnit(bottom, type),
                    CSSUnit(left, type)
            )
        )
    }
    func padding<T: FloatingPoint>(
        _ value: T,
        _ type: CSSUnit.UnitType = .px,
        for direction: FrameDirection = .all
    ) -> HTMLComponent {
        switch direction {
        case .all:
            return add(style: Style("padding", CSSUnit(value, type)))
        case .horizontal:
            return add(style: Style("padding", "0 \(CSSUnit(value, type))"))
        case .vertical:
            return add(style: Style("padding", "\(CSSUnit(value, type)) 0"))
        }
    }
}
