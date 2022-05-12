import Foundation
public extension HTMLComponent {
    func width<T: FloatingPoint>(_ width: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("width", CSSUnit(width, type)))
    }
    func width(_ width: CSSUnit) -> HTMLComponent {
        add(style: Style("width", width))
    }
    func height<T: FloatingPoint>(_ height: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("height", CSSUnit(height, type)))
    }
    func height(_ height: CSSUnit) -> HTMLComponent {
        add(style: Style("height", height))
    }
    func maxWidth<T: FloatingPoint>(_ width: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("max-width", CSSUnit(width, type)))
    }
    func maxWidth(_ width: CSSUnit) -> HTMLComponent {
        add(style: Style("max-width", width))
    }
    func minWidth<T: FloatingPoint>(_ width: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("min-width", CSSUnit(width, type)))
    }
    func minWidth(_ width: CSSUnit) -> HTMLComponent {
        add(style: Style("min-width", width))
    }
    func maxHeight<T: FloatingPoint>(_ height: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("max-height", CSSUnit(height, type)))
    }
    func maxHeight(_ height: CSSUnit) -> HTMLComponent {
        add(style: Style("max-height", height))
    }
    func minHeight<T: FloatingPoint>(_ height: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("min-height", CSSUnit(height, type)))
    }
    func minHeight(_ height: CSSUnit) -> HTMLComponent {
        add(style: Style("min-height", height))
    }
//    func frame(
//        minHeight: CSSUnit?, height: CSSUnit?, maxHeight: CSSUnit?,
//        minWidth: CSSUnit?, width: CSSUnit?, maxWidth: CSSUnit?
//    ) -> HTMLComponent {
//        
//    }
}
