import Foundation

public extension HTMLComponent {
    func with(_ query: MediaQuery) -> HTMLComponent {
        guard let cssClass = cssClass else {
            return self
        }
        
        CSSStyleSheet.add(css: String(describing: query))
        return self
    }
}
