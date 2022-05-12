//
//  This test ensure that css classes and their related stylings work correctly
//
//  E.g. A style applied to a class'd component should be present upon all instances
//  of that class. Conflicts and such should be denoted.
//
//  Created by garrepi on 5/12/22.
//

import XCTest
import HyperSwift

final class CSSClassTests: XCTestCase {
    func testBasicInitalization() {
        let divClass = "div1"
        let width = CSSUnit(500)
        let height = CSSUnit(400)
        let _ = Div(cssClass: divClass)
            .width(width)
            .height(height)
        
        let styles = StyleSheet.styles(for: divClass)
        XCTAssertEqual(styles.count, 2, "Incorrect number of styles")
        XCTAssertTrue(styles.contains { $0.key == "width" }, "Width key did not appear")
        XCTAssertTrue(styles.contains { $0.key == "height" }, "Height key did not appear")
        XCTAssertEqual(styles.first { $0.key == "width" }?.value, width.description,"Width value is incorrect")
        XCTAssertEqual(styles.first { $0.key == "height" }?.value, height.description, "Height value is incorrect")
    }
    
    /**
     This test should ensure adding multiple styles (under the same key) does not lead to multiple styles
     */
    func testDuplicateStyles() {
        let divClass = "div2"
        let width = CSSUnit(500)
        let height = CSSUnit(400)
        let _ = Div(cssClass: divClass)
            .width(width)
            .width(width)
            .height(height)
            .height(height)
        
        let styles = StyleSheet.styles(for: divClass)
        XCTAssertEqual(styles.count, 2, "Incorrect number of styles")
        XCTAssertTrue(styles.contains { $0.key == "width" }, "Width key did not appear")
        XCTAssertTrue(styles.contains { $0.key == "height" }, "Height key did not appear")
        XCTAssertEqual(styles.first { $0.key == "width" }?.value, width.description,"Width value is incorrect")
        XCTAssertEqual(styles.first { $0.key == "height" }?.value, height.description, "Height value is incorrect")
    }
    
    /**
    In the instance if a duplicate style, the one most recently added should be used
     */
    func testConflictingStyles() {
        let divClass = "div3"
        let width = CSSUnit(500)
        let height = CSSUnit(400)
        let newWidth = CSSUnit(600)
        let newHeight = CSSUnit(700)
        let _ = Div(cssClass: divClass)
            .width(width)
            .height(height)
            .width(newWidth)
            .height(newHeight)
        
        let styles = StyleSheet.styles(for: divClass)
        XCTAssertEqual(styles.count, 2, "Incorrect number of styles")
        XCTAssertTrue(styles.contains { $0.key == "width" }, "Width key did not appear")
        XCTAssertTrue(styles.contains { $0.key == "height" }, "Height key did not appear")
        XCTAssertEqual(styles.first { $0.key == "width" }?.value, newWidth.description,"Width value is incorrect")
        XCTAssertEqual(styles.first { $0.key == "height" }?.value, newHeight.description, "Height value is incorrect")
    }
}
