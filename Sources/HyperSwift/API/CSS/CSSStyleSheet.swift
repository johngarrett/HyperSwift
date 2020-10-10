import Foundation

public struct CSSStyleSheet {
    public static var stylesheet: [String: [String]] = ["": [""]]
    private static var rawCssString: String = ""
    public static func add(_ linearKV: String, for className: String) {
        stylesheet[className] = stylesheet[className] ?? [""]
        // temporary, TODO: switch to dictionary
        if !stylesheet[className]!.contains(linearKV) {
            stylesheet[className]!.append(linearKV)
        }
    }
    
    public static func add(_ linearKV: String, for tag: HTMLTag, parent parentClass: String) {
        add(linearKV, for: "\(parentClass)")
    }
    
    public static func add(css: String) {
        rawCssString.append(css)
    }
    
    public static func generateStyleSheet() -> String {
        var output = ""
        for (className, styles) in stylesheet {
            if className == "" {
                continue
            }
            output.append(".\(className) {\n\t")
            output.append(
                "\(styles.joined(separator: "\n\t"))"
            )
            output.append("\n}\n")
        }
        output.append(rawCssString)
        
        return output
    }
}
