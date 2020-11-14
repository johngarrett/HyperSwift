import Foundation

public extension HTMLComponent {
    func padding(
        top: Double=0, right: Double=0, bottom: Double=0, left: Double=0,
        _ type: CSSUnit.UnitType = .px
    ) -> HTMLComponent {
        add(
            style: CSSStyle(
                "padding",
                values:
                    CSSUnit(top, type),
                    CSSUnit(right, type),
                    CSSUnit(bottom, type),
                    CSSUnit(left, type)
            )
        )
    }
    func padding(
        _ value: Double=0,
        _ direction: FrameDirection,
        _ type: CSSUnit.UnitType = .px
    ) -> HTMLComponent {
        switch direction {
        case .all:
            return add(style: CSSStyle("padding", CSSUnit(value, type)))
        case .horizontal:
            return add(style: CSSStyle("padding", "inital \(CSSUnit(value, type))"))
        case .vertical:
            return add(style: CSSStyle("padding", "\(CSSUnit(value, type)) inital"))
        }
    }
}
