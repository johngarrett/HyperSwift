public struct FontFace: CustomStringConvertible {
    let family: String
    let url: String
    let format: FontFormat
    let weight: FontWeight
    
    public var description: String {
        """
        @font-face {
            font-family: \(family);
            src: url(\(url)) format('\(format)');
            font-weight: \(weight);
        }
        """
    }
    
    public init(family: String, url: String, format: FontFormat, weight: FontWeight) {
        self.family = family
        self.url = url
        self.format = format
        self.weight = weight
    }
}
