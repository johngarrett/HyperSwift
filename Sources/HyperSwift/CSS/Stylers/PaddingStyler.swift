import Foundation

public extension HTMLComponent {
    func padding(
        top: Double=0, right: Double=0, bottom: Double=0, left: Double=0,
        _ type: CSSUnit.UnitType = .px
    ) -> HTMLComponent {
        updateComponent(with: "padding:\(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    func padding(
        _ value: Double=0,
        _ direction: FrameDirection,
        _ type: CSSUnit.UnitType = .px
    ) -> HTMLComponent {
        switch direction {
        case .all:
            return updateComponent(with: "padding: \(CSSUnit(value, type));")
        case .horizontal:
            return updateComponent(with: "padding: inital \(CSSUnit(value, type));")
        case .vertical:
            return updateComponent(with: "padding: \(CSSUnit(value, type)) inital;")
        }
    }
}
