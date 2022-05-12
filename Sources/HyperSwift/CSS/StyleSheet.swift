import Foundation

public struct StyleSheet {
    // cssClass: [ [key: value] ]
    public static var fontFaces: [FontFace] = []
    public static var stylesheet: [String: [String: String]] = [:]
    private static var rawCssString: String = ""

    public static func add(_ styles: [Style], to cssClass: String) {
        stylesheet[cssClass] = stylesheet[cssClass] ?? [:]
        for style in styles {
            if let value = stylesheet[cssClass]?[style.key], value != style.value {
                print("[StyleSheet] warning: replacing \(value) with \(style.value) for \(style.key) on \(cssClass)")
            }
            stylesheet[cssClass]?[style.key] = style.value
        }
    }
    
    public static func add(_ style: Style, to cssClass: String) {
        stylesheet[cssClass] = stylesheet[cssClass] ?? [:]
        if let value = stylesheet[cssClass]?[style.key], value != style.value {
            print("[StyleSheet] warning: replacing \(value) with \(style.value) for \(style.key) on \(cssClass)")
        }
        stylesheet[cssClass]?[style.key] = style.value
    }
    
    /**
     clear the stylesheet
     */
    public static func clear() {
        stylesheet.removeAll()
    }

    public static func add(css: String) {
        rawCssString.append(css)
    }
    
    /**
     Get the styles for a given class
     */
    public static func styles(for cssClass: String) -> [Style] {
        (stylesheet[cssClass] ?? [:]).map { Style($0, $1) }
    }
    
    public static func generateStyleSheet() -> String {
        return fontFaces.joined(by: .newLines)
        +
        stylesheet.keys.map { cssClass in
            """
            .\(cssClass.replacingOccurrences(of: " ", with: " .")) {
                \(styles(for: cssClass).joined(by: .newLinesAndTabs))
            }
            """
        }.joined(by: .newLines)
        +
        rawCssString
    }
}
