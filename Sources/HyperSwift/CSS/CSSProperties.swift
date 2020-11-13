import Foundation

public enum TextAlign: String {
    case center, left, right, justify
}

public enum FontWeight: String {
    case normal, medium, bold, bolder, lighter
    case initial, inherit
    case onehundred = "100",
         twohundred = "200",
         threehundred = "300",
         fourhundred = "400",
         fiveehundred = "500",
         sixhundred = "600",
         sevenhundred = "700",
         eighthundred = "800",
         ninehundred = "900"
}

public enum ObjectFit: String {
    case cover, fill, contain, none, scaleDown = "scale-down"
}

public enum DisplayType: String {
    case inline, contents
    case grid, inlineGrid = "inline-grid"
    case block, inlineBlock = "inline-block"
    case flex, inlineFlex = "inline-flex"
    case table, inlineTable = "inline-table"
    case none, hidden, inherit
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
    case breakWord = "break-word"
    case normal
    case inital, inherit
}

public enum WhiteSpace: String {
    case nowrap
    case normal
    case pre, preLine = "pre-line", preWrap = "pre-wrap"
    case initial, inherit
}

public enum Overflow: String {
    case visible, hidden, scroll, auto
}

public enum BorderType: String {
    case dotted, dashed, solid, double, groove, ridge, inset, outset
    case none, hidden
}
