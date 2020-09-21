import XCTest
import HyperSwift

final class DivTests: XCTestCase {
    func testBasicInitalization() {
        let div = Div("div-class-name")
        XCTAssertEqual(div.render(), "<div class=\"div-class-name\"></div>")
    }
}
