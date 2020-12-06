import XCTest
import HyperSwift

final class HTMLComponentTests: XCTestCase {
    let cssClass = "class-name"
    
    func testBasicInitalization() {
        XCTAssertEqual(
            HTMLComponent(.h1) { }.render(),
            "<h1></h1>"
        )
    }
    
    func testTrailingFunctionBuilder() {
        XCTAssertEqual(
            HTMLComponent(.h1) { "Text" }.render(),
            "<h1>Text</h1>"
        )
    }
}
