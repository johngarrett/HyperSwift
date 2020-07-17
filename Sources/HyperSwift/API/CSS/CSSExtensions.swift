import Foundation

extension HTMLComponent {
    public func margin(top: Double=0, right: Double=0,
                bottom: Double=0, left: Double=0,
                _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "margin: \(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    public func margin(_ all: Double=0, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "margin: \(CSSUnit(all, type));")
    }
    
    public func position(top: Int, left: Int) -> HTMLComponent {
        updateComponent(with: "top: \(top); left: \(left);")
    }
    
    public func zIndex(_ index: Int) -> HTMLComponent {
        updateComponent(with: "z-index: \(index);")
    }
    
    public func color(_ color: CSSColor) -> HTMLComponent {
        updateComponent(with: "color:\(color.description);")
    }
    
    public func width(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "width:\(CSSUnit(width, type));")
    }
    public func height(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "height:\(CSSUnit(height, type));")
    }
    
    public func maxWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "max-width:\(CSSUnit(width, type));")
    }
    public func minWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "min-width:\(CSSUnit(width, type));")
    }
    public func maxHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "max-height:\(CSSUnit(height, type));")
    }
    public func minHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "min-height:\(CSSUnit(height, type));")
    }
    
    public func shadow(x: Int=0, y:Int=0, spread:Int=0, blur:Int = 0, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "box-shadow:\(x)px \(y)px \(blur)px \(spread)px \(color.description);")
    }
    
    public func wordWrap(_ wrap: WordWrap) -> HTMLComponent {
        updateComponent(with: "word-wrap: \(wrap.rawValue);")
    }
    public func overflow(_ overflow: Overflow) -> HTMLComponent {
        updateComponent(with: "overflow: \(overflow.rawValue);")
    }

    public func objectFit(_ of: ObjectFit) -> HTMLComponent {
        updateComponent(with: "object-fit:\(of.rawValue);")
    }
    
    public func whiteSpace(_ wp: WhiteSpace) -> HTMLComponent {
        updateComponent(with: "white-space: \(wp.rawValue);")
    }
    
    public func textAlign(_ ta: TextAlign) -> HTMLComponent {
           updateComponent(with: "text-align: \(ta.rawValue);")
       }
    
    public func textDecoration(_ td: TextDecoration) -> HTMLComponent {
        updateComponent(with: "text-decoration: \(td.rawValue);")
    }

    public func backgroundColor(_ color:CSSColor) -> HTMLComponent {
        updateComponent(with: "background-color: \(color.description);")
    }
    
    public func borderRadius(_ radius: Double) -> HTMLComponent {
        updateComponent(with: "border-radius: \(radius)px;")
    }
    
    public func display(_ dt: DisplayType) -> HTMLComponent {
        updateComponent(with: "display: \(dt.rawValue);")
    }
    public func justifyContent(_ jst: Justification) -> HTMLComponent {
        updateComponent(with: "justify-content: \(jst.rawValue);")
    }
    public func alignItems(_ alignment: Alignment) -> HTMLComponent {
        updateComponent(with: "align-items: \(alignment.rawValue);")
    }
    public func flexDirection(_ direction: FlexDirection) -> HTMLComponent {
        updateComponent(with: "flex-direction: \(direction.rawValue);")
    }
    public func flexWrap(_ wrap: FlexWrap) -> HTMLComponent {
        updateComponent(with: "flex-wrap: \(wrap.rawValue);")
    }

    public func gridGap(_ space: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "grid-gap: \(CSSUnit(space, type));")
    }
    
    public func font(weight: String, size: Double, family: String) -> HTMLComponent {
        updateComponent(with: "font-weight:\(weight); font-size:\(size)px; font-family:\(family);")
    }
    
    public func rawCSS(_ key: String, _ value: String) -> HTMLComponent {
        updateComponent(with: "\(key): \(value);")
    }

    public func padding(top: Double=0, right: Double=0, bottom: Double=0, left: Double=0, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "padding:\(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    public func padding(_ all: Double=0, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "padding:\(CSSUnit(all, type));")
    }
    
    private func updateComponent(with style: String) -> HTMLComponent {
        if className != "" {
            if self.tag != .div && self.tag != .empty {
                CSSStyleSheet.add(style, for: self.tag, parent: className)
            } else {
                CSSStyleSheet.add(style, for: className)
            }
        } else {
            var newAttributes = self.attributes
            if newAttributes["style"] == nil {
                newAttributes["style"] = style
            } else {
                newAttributes["style"]!.append(style)
            }
            self.attributes = newAttributes
        }
        return self
    }
}
