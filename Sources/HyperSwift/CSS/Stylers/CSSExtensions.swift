import Foundation

public extension HTMLComponent {
    func position(top: Int, left: Int) -> HTMLComponent {
        add(styles: Style("top", top), Style("left", left))
    }
    
    func zIndex(_ index: Int) -> HTMLComponent {
        add(style: Style("z-index", index))
    }
    
    func color(_ color: CSSColor) -> HTMLComponent {
        add(style: Style("color", color))
    }
    
    func color(_ rawColor: String) -> HTMLComponent {
        add(style: Style("color", CSSColor(rawColor)))
    }

    func shadow<T: FloatingPoint>(x: T = 0, y: T = 0, spread: T = 0, blur: T = 0, color: CSSColor) -> HTMLComponent {
        add(style: Style("box-shadow", "\(x)px \(y)px \(blur)px \(spread)px \(color.description)"))
    }
    
    func wordWrap(_ wrap: WordWrap) -> HTMLComponent {
        add(style: Style("word-wrap", wrap.rawValue))
    }
    func overflow(_ overflow: Overflow) -> HTMLComponent {
        add(style: Style("overflow", overflow.rawValue))
    }

    func objectFit(_ fit: ObjectFit) -> HTMLComponent {
        add(style: Style("object-fit", fit.rawValue))
    }
    
    func whiteSpace(_ space: WhiteSpace) -> HTMLComponent {
        add(style: Style("white-space", space.rawValue))
    }
    
    func textAlign(_ alignment: TextAlign) -> HTMLComponent {
        add(style: Style("text-align", alignment.rawValue))
    }
    
    func textDecoration(_ decoration: TextDecoration) -> HTMLComponent {
        add(style: Style("text-decoration", decoration.rawValue))
    }

    func backgroundColor(_ color:CSSColor) -> HTMLComponent {
        add(style: Style("background-color", color))
    }
    func backgroundColor(_ rawColor:String) -> HTMLComponent {
        add(style: Style("background-color", rawColor))
    }
    
    func border<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: Style("border", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderRight<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: Style("border-right", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderLeft<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: Style("border-left", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderTop<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: Style("border-top", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderBottom<T: FloatingPoint>(_ radius: T, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        add(style: Style("border-bottom", "\(radius)px \(type.rawValue) \(color.description)"))
    }
    func borderRadius<T: FloatingPoint>(_ radius: T) -> HTMLComponent {
        add(style: Style("border-radius", "\(radius)px"))
    }
    func display(_ dt: DisplayType) -> HTMLComponent {
        add(style: Style("display", dt.rawValue))
    }
    func justifyContent(_ jst: Justification) -> HTMLComponent {
        add(style: Style("justify-content", jst.rawValue))
    }
    func alignItems(_ alignment: Alignment) -> HTMLComponent {
        add(style: Style("align-items", alignment.rawValue))
    }
    func flexDirection(_ direction: FlexDirection) -> HTMLComponent {
        add(style: Style("flex-direction", direction.rawValue))
    }
    func flexGrow(_ value: Int) -> HTMLComponent {
        add(style: Style("flex-grow", value))
    }
    func flexShrink(_ value: Int) -> HTMLComponent {
        add(style: Style("flex-shrink", value))
    }
    func flexWrap(_ wrap: FlexWrap) -> HTMLComponent {
        add(style: Style("flex-wrap", wrap.rawValue))
    }

    func gridGap<T: FloatingPoint>(_ space: T, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        add(style: Style("grid-gap", CSSUnit(space, type)))
    }
}
