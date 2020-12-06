import Foundation
public extension HTMLComponent {
    func font(weight: FontWeight?, size: CSSUnit?, family: String?) -> HTMLComponent {
        var styles = [CSSStyle]()
        
        if let weight = weight {
            styles.append(CSSStyle("font-weight", weight.rawValue))
        }
        if let size = size {
            styles.append(CSSStyle("font-size", size.description))
        }
        
        if let family = family {
            styles.append(CSSStyle("font-family", family))
        }
        
        var newSelf = self
        styles.forEach {
            newSelf = add(style: $0)
        }
        
        return newSelf
    }
    
    func font(weight: String?, size: CSSUnit?, family: String?) -> HTMLComponent {
        var styles = [CSSStyle]()
        
        if let weight = weight {
            styles.append(CSSStyle("font-weight", weight))
        }
        if let size = size {
            styles.append(CSSStyle("font-size", size.description))
        }
        
        if let family = family {
            styles.append(CSSStyle("font-family", family))
        }
        
        var newSelf = self
        styles.forEach {
            newSelf = add(style: $0)
        }
        
        return newSelf
    }
}
