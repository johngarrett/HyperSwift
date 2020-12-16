extension Array {
    enum Seperator: String {
        case newLines = "\n"
        case newLinesAndTabs = "\n\t"
        
    }
    func joined(by seperator: Seperator) -> String {
        self.map { String(describing: $0) }.joined(separator: seperator.rawValue)
    }
}
