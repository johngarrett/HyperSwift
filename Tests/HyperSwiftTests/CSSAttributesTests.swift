import XCTest
import HyperSwift

final class CSSAttributesTests: XCTestCase {
    let base = Div { }

    func testBasicAttribute() {
        XCTAssertEqual(base.render(), "<div></div>")
        XCTAssertEqual(
            base.width(50).render(),
            "<div style=\"width:50.0px;\"></div>"
        )
    }
    
    func testMultipleAttributes() {
        XCTAssertEqual(
            base.width(50).height(50).render(),
            "<div style=\"width:50.0px;height:50.0px;\"></div>"
        )
    }
    
    func testAttributesAfterBuilder() {
        XCTAssertEqual(
            Div {
                "Hello"
            }
            .width(50)
            .render(),
            "<div style=\"width:50.0px;\">Hello</div>"
        )
        XCTAssertEqual(
            Div {
                "Hello"
                "Hello"
            }
            .width(50)
            .render(),
            "<div style=\"width:50.0px;\">HelloHello</div>"
        )
        XCTAssertEqual(
            Div {
                Paragraph("Hello")
            }
            .width(50)
            .render(),
            "<div style=\"width:50.0px;\"><p>Hello</p></div>"
        )
        XCTAssertEqual(
            Div {
                Paragraph("Hello")
                Paragraph("Hello")
            }
            .width(50)
            .render(),
            "<div style=\"width:50.0px;\"><p>Hello</p><p>Hello</p></div>"
        )
    }
}
