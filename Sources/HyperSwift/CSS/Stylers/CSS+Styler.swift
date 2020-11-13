import Foundation

public extension HTMLComponent {
    func updateComponent(with style: String) -> HTMLComponent {
        if cssClass != "" {
            if self.tag != .div && self.tag != .empty {
                CSSStyleSheet.add(style, for: self.tag, parent: cssClass)
            } else {
                CSSStyleSheet.add(style, for: cssClass)
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
    func rawCSS(_ key: String, _ value: String) -> HTMLComponent {
        updateComponent(with: "\(key): \(value);")
    }
    
    func inject(_ css: String) -> HTMLComponent {
        CSSStyleSheet.add(css: css)
        return self
    }
}
