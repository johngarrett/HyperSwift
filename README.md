## HyperSwift - a HTML and CSS Generator
[![Swift 5.2](https://img.shields.io/badge/swift-5.2-ED523F.svg?style=flat)](https://swift.org/download/)
[![@garrepi](https://img.shields.io/badge/contact-@garrepi-73c5ff.svg?style=flat)](https://twitter.com/garrepi)

#### About
HyperSwift (name pending) is a DSL written purely in Swift aimed to generate HTML styled with CSS.
#### Main Features
- Vertical and Horizontal stack wrappers
- Native HTML Elements
- CSS Stylesheet generation
#### Code Snippits
505 Page from [garrepi.dev](https://www.garrepi.dev):
```swift
import HyperSwift

VStack(justify: .center, align: .center) {
  HStack(justify: .spaceEvenly, align: .center) {
    Image(url: "/images/error_bomb.png")
      .width(100)
      .height(100)
    Header(.header3) { "HTTP 500" }
      .font(weight: "bold", size: 40, family: "SF Mono")
  }          
  Paragraph(fiveOfiveMessage)
}
.backgroundColor(GColors.lightRed)
.textAlign(.center)
.margin(5, .percent)
.display(.flex)
.shadow(x: 20, y: 30, color: GColors.cardShadow)
.border(width: 1, color: .black)
```
![output](https://media.discordapp.net/attachments/732426870100066455/733822598504513566/unknown.png)
#### Examples
HyperSwift is being used on [garrepi.dev](https://www.garrepi.dev) as we speak! Checkout the source code [here](https://github.com/johngarrett/g-server/). 
#### Contributing
I have little free time and an even little-er ability to focus on one project. Feel free to send in a PR with ideas, suggestions, or implimented code!
#### TODO
The following need to get done before a 1.0
[] Add Example
[] Add Root
[] Bring CSSPage generation over from g-server
