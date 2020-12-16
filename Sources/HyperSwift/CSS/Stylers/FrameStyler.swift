import Foundation
public extension HTMLComponent {
    func width<T: FloatingPoint>(_ width: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("width", CSSUnit(width, type)))
    }
    func height<T: FloatingPoint>(_ height: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("height", CSSUnit(height, type)))
    }
    func maxWidth<T: FloatingPoint>(_ width: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("max-width", CSSUnit(width, type)))
    }
    func minWidth<T: FloatingPoint>(_ width: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("min-width", CSSUnit(width, type)))
    }
    func maxHeight<T: FloatingPoint>(_ height: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("max-height", CSSUnit(height, type)))
    }
    func minHeight<T: FloatingPoint>(_ height: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("min-height", CSSUnit(height, type)))
    }
//    func frame(
//        minHeight: CSSUnit?, height: CSSUnit?, maxHeight: CSSUnit?,
//        minWidth: CSSUnit?, width: CSSUnit?, maxWidth: CSSUnit?
//    ) -> HTMLComponent {
//        
//    }
}
