import XCTest
import HyperSwift

final class LinkTests: XCTestCase {
    let cssClass = "class-name"
    let id = "link-id"
    let href = "www.google.com/hello"
    let attributes = [
        "target": "_blank",
        "rel": "noopener noreferrer"
    ]

    func testWithAttributes() {
        XCTAssertEqual(
            Link(cssClass, id: id, href: href, attributes: attributes) {
                Paragraph("hello")
            }.render(),
            """
            <a class="class-name" href="www.google.com/hello" id="link-id" rel="noopener noreferrer" target="_blank"><p>hello</p></a>
            """
        )
    }
}
