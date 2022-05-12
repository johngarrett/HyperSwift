import Foundation

public extension HTMLComponent {
    func with(_ query: MediaQuery) -> HTMLComponent {
        guard let cssClass = cssClass else {
            return self
        }
        
        StyleSheet.add(css: String(describing: query))
        return self
    }
}
