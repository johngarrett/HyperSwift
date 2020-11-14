import Foundation

public extension HTMLComponent {
    func add(style: CSSStyle) -> HTMLComponent {
        styles.append(style)
        legacyInsert(style: String(describing: style))
        return self
    }
    func add(styles: CSSStyle...) -> HTMLComponent {
        self.styles.append(contentsOf: styles)
        styles.forEach { style in
            legacyInsert(style: String(describing: style))
        }
        return self
    }
    
    func inject(_ css: String) -> HTMLComponent {
        CSSStyleSheet.add(css: css)
        return self
    }
    
    private func legacyInsert(style: String) {
        return
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
    }
}
