import Foundation

public extension HTMLComponent {
    func margin<T: FloatingPoint>(
        top: T=0, right: T=0, bottom: T=0, left: T=0,
        _ type: CSSUnit.UnitType = .px
    ) -> HTMLComponent {
        add(
            style: CSSStyle(
                "margin",
                values:
                    CSSUnit(top, type),
                    CSSUnit(right, type),
                    CSSUnit(bottom, type),
                    CSSUnit(left, type)
            )
        )
    }

    func margin<T: FloatingPoint>(_ value: T, _ type: CSSUnit.UnitType = .px, for direction: FrameDirection = .all) -> HTMLComponent {
        switch direction {
        case .all:
            return add(style: CSSStyle("margin", CSSUnit(value, type)))
        case .horizontal:
            return add(style: CSSStyle("margin", "0 \(CSSUnit(value, type))"))
        case .vertical:
            return add(style: CSSStyle("margin", "\(CSSUnit(value, type)) 0"))
        }
    }
}
