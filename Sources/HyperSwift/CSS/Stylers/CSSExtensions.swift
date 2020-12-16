import Foundation

public extension HTMLComponent {
    func position(top: Int, left: Int) -> HTMLComponent {
        add(styles: CSSStyle("top", top), CSSStyle("left", left))
    }
    
    func zIndex(_ index: Int) -> HTMLComponent {
        add(style: CSSStyle("z-index", index))
    }
    
    func color(_ color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("color", color))
    }
    
    func color(_ rawColor: String) -> HTMLComponent {
        add(style: CSSStyle("color", CSSColor(rawColor)))
    }

    func shadow<T: FloatingPoint>(x: T = 0, y: T = 0, spread: T = 0, blur: T = 0, color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("box-shadow", "\(x)px \(y)px \(blur)px \(spread)px \(color.description)"))
    }
    
    func wordWrap(_ wrap: WordWrap) -> HTMLComponent {
        add(style: CSSStyle("word-wrap", wrap.rawValue))
    }
    func overflow(_ overflow: Overflow) -> HTMLComponent {
        add(style: CSSStyle("overflow", overflow.rawValue))
    }

    func objectFit(_ fit: ObjectFit) -> HTMLComponent {
        add(style: CSSStyle("object-fit", fit.rawValue))
    }
    
    func whiteSpace(_ space: WhiteSpace) -> HTMLComponent {
        add(style: CSSStyle("white-space", space.rawValue))
    }
    
    func textAlign(_ alignment: TextAlign) -> HTMLComponent {
        add(style: CSSStyle("text-align", alignment.rawValue))
    }
    
    func textDecoration(_ decoration: TextDecoration) -> HTMLComponent {
        add(style: CSSStyle("text-decoration", decoration.rawValue))
    }

    func backgroundColor(_ color:CSSColor) -> HTMLComponent {
        add(style: CSSStyle("background-color", color))
    }
    func backgroundColor(_ rawColor:String) -> HTMLComponent {
        add(style: CSSStyle("background-color", rawColor))
    }
    
    func border<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("border", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderRight<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("border-right", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderLeft<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("border-left", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderTop<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("border-top", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderBottom<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: CSSStyle("border-bottom", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderRadius<T: FloatingPoint>(_ radius: T) -> HTMLComponent {
        add(style: CSSStyle("border-radius", "\(radius)px"))
    }
    func display(_ dt: DisplayType) -> HTMLComponent {
        add(style: CSSStyle("display", dt.rawValue))
    }
    func justifyContent(_ jst: Justification) -> HTMLComponent {
        add(style: CSSStyle("justify-content", jst.rawValue))
    }
    func alignItems(_ alignment: Alignment) -> HTMLComponent {
        add(style: CSSStyle("align-items", alignment.rawValue))
    }
    func flexDirection(_ direction: FlexDirection) -> HTMLComponent {
        add(style: CSSStyle("flex-direction", direction.rawValue))
    }
    func flexGrow(_ value: Int) -> HTMLComponent {
        add(style: CSSStyle("flex-grow", value))
    }
    func flexShrink(_ value: Int) -> HTMLComponent {
        add(style: CSSStyle("flex-shrink", value))
    }
    func flexWrap(_ wrap: FlexWrap) -> HTMLComponent {
        add(style: CSSStyle("flex-wrap", wrap.rawValue))
    }

    func gridGap<T: FloatingPoint>(_ space: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: CSSStyle("grid-gap", CSSUnit(space, type)))
    }
}
