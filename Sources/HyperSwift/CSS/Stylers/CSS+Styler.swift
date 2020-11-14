import Foundation

public extension HTMLComponent {
    func add(style: CSSStyle) -> HTMLComponent {
        styles.append(style)
        return self
    }
    func add(styles: CSSStyle...) -> HTMLComponent {
        self.styles.append(contentsOf: styles)
        return self
    }
    
    func inject(_ css: String) -> HTMLComponent {
        CSSStyleSheet.add(css: css)
        return self
    }
}
