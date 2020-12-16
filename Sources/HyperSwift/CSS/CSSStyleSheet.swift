import Foundation

public struct CSSStyleSheet {
    public static var stylesheet: [String: [CSSStyle]] = [:]
    private static var rawCssString: String = ""

    public static func add(_ styles: [CSSStyle], to cssClass: String) {
        stylesheet[cssClass] = (stylesheet[cssClass] ?? []) + styles
    }

    public static func add(css: String) {
        rawCssString.append(css)
    }
    
    public static func generateStyleSheet() -> String {
        // check for duplicity
        for (cssClass, styles) in stylesheet {
            for (cssKey, cssValues) in Dictionary(grouping: styles, by: { $0.key }) where cssValues.count > 1 {
                print(
                    """
                    [StyleSheet]: WARNING! Duplicate occurance for key `\(cssKey)` in \(cssClass)
                        \(cssValues.joined(by: .newLinesAndTabs))
                    """
                )
            }
        }

        return stylesheet
            .filter { !$0.key.isEmpty }
            .map { className, styles in
                """
                .\(className.replacingOccurrences(of: " ", with: " .")) {
                    \(styles.joined(by: .newLinesAndTabs))
                }
                """
            }.joined(separator: "\n")
        + rawCssString
    }
}
