import Foundation

extension Array where Element: CustomStringConvertible {
    func flattened(separator: String = "") -> String? {
        self.isEmpty
            ? nil
            : self.map { String(describing: $0) }.joined(separator: separator)
    }
}
