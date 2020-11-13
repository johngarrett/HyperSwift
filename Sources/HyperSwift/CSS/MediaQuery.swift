/*
 @media not|only mediatype and (mediafeature and|or|not mediafeature) {
 CSS-Code;
 }
 */

public struct MediaQuery: CustomStringConvertible {

    enum MediaFeature: String {
        case height, maxHeight = "max-height", minHeight = "min-height"
        case width, maxWidth = "max-width", minWidth = "min-width"
        #warning("missing a ton of mediafeatures: https://www.w3schools.com/cssref/css3_pr_mediaquery.asp")
    }
    
    enum MediaType: String {
        case all, print, speech, screen
    }
    
    let type: MediaType?
    let feature: MediaFeature
    let value: String
    
    public var description: String {
        """
        @media \(type?.rawValue ?? "") \(feature.rawValue)(\(value)) {
        }
        """
    }
}
