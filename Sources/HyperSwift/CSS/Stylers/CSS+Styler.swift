import Foundation

public extension HTMLComponent {
    func add(style: Style) -> HTMLComponent {
        styles.append(style)
        if let cssClass = self.cssClass {
            StyleSheet.add(style, to: cssClass)
        }
        return self
    }
    func add(styles: Style...) -> HTMLComponent {
        self.styles.append(contentsOf: styles)
        return self
    }
    
    func inject(_ css: String) -> HTMLComponent {
        StyleSheet.add(css: css)
        return self
    }
}
