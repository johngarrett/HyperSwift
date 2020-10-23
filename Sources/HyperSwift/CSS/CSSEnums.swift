import Foundation

public enum TextAlign: String {
    case center
    case left
    case right
}

public enum FontWeight: String {
    case normal, bold, bolder, lighter,
    onehundred = "100", twohundred = "200", threehundred = "300",
    fourhundred = "400", fiveehundred = "500", sixhundred = "600",
    sevenhundred = "700", eighthundred = "800", ninehundred = "900",
    initial, inherit
}

public enum ObjectFit: String {
    case cover
}

public enum DisplayType: String {
    case grid
    case block
    case inlineBlock = "inline-block"
    case flex
}

public enum Justification: String {
    case flexStart = "flex-start"
    case flexEnd = "flex-end"
    case center
    case spaceBetween = "space-between"
    case spaceAround = "space-around"
    case spaceEvenly = "space-evenly"
}

public enum Alignment: String {
    case flexStart = "flex-start"
    case flexEnd = "flex-end"
    case center
    case baseline
    case stretch
}

public enum FlexDirection: String {
    case row
    case column
}

public enum FlexWrap: String {
    case nowrap
    case wrap
    case reverse = "wrap-reverse"
}

public enum TextDecoration: String {
    case none
}

public enum WordWrap: String {
    case brk = "break-word"
    case normal
}

public enum WhiteSpace: String {
    case nowrap
}

public enum Overflow: String {
    case visible, hidden, scroll, auto
}

public enum BorderType: String {
    case dotted, dashed, solid, double, groove,
        ridge, inset, outset, none, hidden
}
