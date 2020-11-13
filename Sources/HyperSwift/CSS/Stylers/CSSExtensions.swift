import Foundation

public extension HTMLComponent {
    func position(top: Int, left: Int) -> HTMLComponent {
        updateComponent(with: "top: \(top); left: \(left);")
    }
    
    func zIndex(_ index: Int) -> HTMLComponent {
        updateComponent(with: "z-index: \(index);")
    }
    
    func color(_ color: CSSColor) -> HTMLComponent {
        updateComponent(with: "color:\(color.description);")
    }

    func shadow(x: Int=0, y:Int=0, spread:Int=0, blur:Int = 0, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "box-shadow:\(x)px \(y)px \(blur)px \(spread)px \(color.description);")
    }
    
    func wordWrap(_ wrap: WordWrap) -> HTMLComponent {
        updateComponent(with: "word-wrap: \(wrap.rawValue);")
    }
    func overflow(_ overflow: Overflow) -> HTMLComponent {
        updateComponent(with: "overflow: \(overflow.rawValue);")
    }

    func objectFit(_ of: ObjectFit) -> HTMLComponent {
        updateComponent(with: "object-fit:\(of.rawValue);")
    }
    
    func whiteSpace(_ wp: WhiteSpace) -> HTMLComponent {
        updateComponent(with: "white-space: \(wp.rawValue);")
    }
    
    func textAlign(_ ta: TextAlign) -> HTMLComponent {
           updateComponent(with: "text-align: \(ta.rawValue);")
       }
    
    func textDecoration(_ td: TextDecoration) -> HTMLComponent {
        updateComponent(with: "text-decoration: \(td.rawValue);")
    }

    func backgroundColor(_ color:CSSColor) -> HTMLComponent {
        updateComponent(with: "background-color: \(color.description);")
    }
    
    func border(_ radius: Double, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "border: \(radius)px \(type.rawValue) \(color.description);")
    }
    func borderRight(_ radius: Double, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "border-right: \(radius)px \(type.rawValue) \(color.description);")
    }
    func borderLeft(_ radius: Double, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "border-left: \(radius)px \(type.rawValue) \(color.description);")
    }
    func borderTop(_ radius: Double, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "border-top: \(radius)px \(type.rawValue) \(color.description);")
    }
    func borderBottom(_ radius: Double, _ type: BorderType, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "border-bottom: \(radius)px \(type.rawValue) \(color.description);")
    }
    func borderRadius(_ radius: Double) -> HTMLComponent {
        updateComponent(with: "border-radius: \(radius)px;")
    }
    func display(_ dt: DisplayType) -> HTMLComponent {
        updateComponent(with: "display: \(dt.rawValue);")
    }
    func justifyContent(_ jst: Justification) -> HTMLComponent {
        updateComponent(with: "justify-content: \(jst.rawValue);")
    }
    func alignItems(_ alignment: Alignment) -> HTMLComponent {
        updateComponent(with: "align-items: \(alignment.rawValue);")
    }
    func flexDirection(_ direction: FlexDirection) -> HTMLComponent {
        updateComponent(with: "flex-direction: \(direction.rawValue);")
    }
    func flexWrap(_ wrap: FlexWrap) -> HTMLComponent {
        updateComponent(with: "flex-wrap: \(wrap.rawValue);")
    }

    func gridGap(_ space: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "grid-gap: \(CSSUnit(space, type));")
    }
    func font(weight: FontWeight, size: Double, family: String) -> HTMLComponent {
        updateComponent(with: "font-weight:\(weight.rawValue); font-size:\(size)px; font-family:\(family);")
    }
    
    func font(weight: String, size: Double, family: String) -> HTMLComponent {
        updateComponent(with: "font-weight:\(weight); font-size:\(size)px; font-family:\(family);")
    }
}
