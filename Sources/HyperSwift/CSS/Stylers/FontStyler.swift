import Foundation
public extension HTMLComponent {
    func font(weight: FontWeight? = nil, size: CSSUnit? = nil, family: String? = nil) -> HTMLComponent {
        var styles = [Style]()
        
        if let weight = weight {
            styles.append(Style("font-weight", weight.rawValue))
        }
        if let size = size {
            styles.append(Style("font-size", size.description))
        }
        
        if let family = family {
            styles.append(Style("font-family", family))
        }
        
        var newSelf = self
        styles.forEach {
            newSelf = add(style: $0)
        }
        
        return newSelf
    }
    /**
        This takes in an int parameter and deafults to `px`
     */
    func font<T: FloatingPoint>(weight: FontWeight? = nil, size: T? = nil, family: String? = nil) -> HTMLComponent {
        if let size = size {
            return font(weight: weight, size: CSSUnit(size, .px), family: family)
        } else {
            return font(weight: weight, size: nil, family: family)
        }
    }
    
    @_disfavoredOverload
    func font(weight: String? = nil, size: CSSUnit? = nil, family: String? = nil) -> HTMLComponent {
        var styles = [Style]()
        
        if let weight = weight {
            styles.append(Style("font-weight", weight))
        }
        if let size = size {
            styles.append(Style("font-size", size.description))
        }
        
        if let family = family {
            styles.append(Style("font-family", family))
        }
        
        var newSelf = self
        styles.forEach {
            newSelf = add(style: $0)
        }
        
        return newSelf
    }
}
