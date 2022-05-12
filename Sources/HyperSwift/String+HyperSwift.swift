import Foundation

/**
 A string can be a displayable element.
 
 E.g. when we want to do something like
 ```
 Div {
    "Hello World!"
 }
 ```
 The string will be interepreted as a Displayable element
 */
extension String: Displayable {
    public func render() -> String {
        self
    }
}
