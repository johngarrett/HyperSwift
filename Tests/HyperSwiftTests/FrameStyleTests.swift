import XCTest
import HyperSwift

final class FrameStyleTests: XCTestCase {
    let cssClass = "class-name"
    
    func testMargins() {
        let d = Div("hey") { "" }
            .margin(20)
            .margin(top: 20, .percent)
            .margin(20, .px, for: .horizontal)
            .margin(20, for: .vertical)
        print(d)
        print(CSSStyleSheet.generateStyleSheet())
    }
    func testPadding() {
        let _ = Div { "" }
            .padding(20)
            .padding(top: 20, .percent)
            .padding(20, .px, for: .horizontal)
            .padding(20, for: .vertical)
    }
}
