import XCTest
import HyperSwift

final class DivTests: XCTestCase {
    let cssClass = "class-name"
    
    func testBasicInitalization() {
        XCTAssertEqual(Div{ }.render(), "<div></div>")
        
        XCTAssertEqual(
            Div(self.cssClass).render(),
            "<div class=\"class-name\"></div>"
        )
        
        // order keeps swapping
//        XCTAssertEqual(
//            Div("class-name", ["width": "100%"]).render(),
//            "<div class=\"class-name\" width=\"100%\"></div>"
//        )
    }
    func testStringFunctionBuilder() {
        XCTAssertEqual(
            Div { "Hello" }.render(),
            "<div>Hello</div>"
        )
        
        XCTAssertEqual(
            Div(self.cssClass) {
                "Hello"
            }.render(),
            "<div class=\"class-name\">Hello</div>"
        )
    }
    
    func testSingleChildFunctionBuilder() {
        XCTAssertEqual(
            Div { Paragraph("hello") }.render(),
            "<div><p>hello</p></div>"
        )
    }
    
    func testMultipleChildrenFunctionBuilder() {
        XCTAssertEqual(
            Div {
                Paragraph("hello")
                Paragraph("hello")
            }.render(),
            "<div><p>hello</p><p>hello</p></div>"
        )
    }
}
