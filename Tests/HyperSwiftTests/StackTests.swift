import XCTest
import HyperSwift

final class SlackTests: XCTestCase {
    let cssClass = "stack-name"
    

    func isValid(_ stack: HStack) -> Bool {
        stack.render().contains("display:flex") && stack.render().contains("direction:row")
    }
    
    func isValid(_ stack: VStack) -> Bool {
        stack.render().contains("display:flex") && stack.render().contains("direction:column")
    }
    
    func testBasicInitalization() {
        XCTAssertTrue(isValid(HStack { }))
        XCTAssertTrue(isValid(VStack { }))
    }
}
