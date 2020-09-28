import XCTest
import HyperSwift

final class HTMLComponentTests: XCTestCase {
    let cssClass = "class-name"
    
    func testBasicInitalization() {
        XCTAssertEqual(
            HTMLComponent(.header1) { }.render(),
            "<h1></h1>"
        )
    }
    
    func testTrailingFunctionBuilder() {
        XCTAssertEqual(
            HTMLComponent(.header1) { "Text" }.render(),
            "<h1>Text</h1>"
        )
    }
}
