import Foundation

public struct CSSStyleSheet {
    public static var stylesheet: [String: [String]] = ["": [""]]
    private static var rawCssString: String = ""
    public static func add(_ linearKV: String, for className: String) {
        stylesheet[className] = stylesheet[className] ?? [""]
        // temporary, TODO: switch to dictionary
        if stylesheet[className] != nil {
            if !stylesheet[className]!.contains(linearKV) {
                stylesheet[className]!.append(linearKV)
            }
        } else {
            print("className \(className) was nil in stylesheet")
        }
    }
    
    public static func add(_ linearKV: String, for tag: HTMLTag, parent parentClass: String) {
        add(linearKV, for: "\(parentClass)")
    }
    
    public static func add(css: String) {
        rawCssString.append(css)
    }
    
    public static func generateStyleSheet() -> String {
        /** UNTESTED:
         stylesheet
         .filter { !$0.key.isEmpty && $0.value.count != 0 }
         .map { (cssClass, styles) in
         ".\(cssClass) {\n\t" + styles.joined(separator: "\n\t")
         }
         .joined(separator: "\n")
         .appending("\n}\n")
         */
        
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
