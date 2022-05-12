import XCTest
import HyperSwift

final class FrameStyleTests: XCTestCase {
    func testMargins() {
        let d = Div("hey") { "" }
            .margin(20)
            .margin(top: 20, .percent)
            .margin(20, .px, for: .horizontal)
            .margin(20, for: .vertical)
            .border(14, .dashed, color: CSSColor("white"))
        let ld = Div("hey llo") { "" }
            .margin(20)
            .margin(top: 20, .percent)
            .margin(20, .px, for: .horizontal)
            .margin(20, for: .vertical)
            .border(14, .dashed, color: CSSColor("white"))
    }
    func testPadding() {
        let _ = Div { "" }
            .padding(20)
            .padding(top: 20, .percent)
            .padding(20, .px, for: .horizontal)
            .padding(20, for: .vertical)
    }
}
