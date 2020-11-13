import Foundation

public extension HTMLComponent {
    func width(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "width:\(CSSUnit(width, type));")
    }
    func height(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "height:\(CSSUnit(height, type));")
    }

    func maxWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "max-width:\(CSSUnit(width, type));")
    }
    func minWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "min-width:\(CSSUnit(width, type));")
    }
    func maxHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "max-height:\(CSSUnit(height, type));")
    }
    func minHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "min-height:\(CSSUnit(height, type));")
    }
}
