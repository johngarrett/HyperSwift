import Foundation

public extension HTMLComponent {
    func width(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("width", CSSUnit(width, type)))
    }
    func height(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("height", CSSUnit(height, type)))
    }
    func maxWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("max-width", CSSUnit(width, type)))
    }
    func minWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("min-width", CSSUnit(width, type)))
    }
    func maxHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("max-height", CSSUnit(height, type)))
    }
    func minHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("min-height", CSSUnit(height, type)))
    }
//    func frame(
//        minHeight: CSSUnit?, height: CSSUnit?, maxHeight: CSSUnit?,
//        minWidth: CSSUnit?, width: CSSUnit?, maxWidth: CSSUnit?
//    ) -> HTMLComponent {
//        
//    }
}
