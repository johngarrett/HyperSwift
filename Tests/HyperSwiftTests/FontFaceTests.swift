import XCTest
import HyperSwift

final class FontFaceTests: XCTestCase {
    
    func testBasicInitalization() {
        let ff = FontFace(family: "Helvetica", url: "./h.ttf", format: .truetype, weight: .bold)
        StyleSheet.fontFaces.append(ff)
        
        XCTAssertTrue(StyleSheet.generateStyleSheet().contains(ff.description))
    }
}
