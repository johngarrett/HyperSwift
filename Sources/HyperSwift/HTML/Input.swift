import Foundation

public enum InputType: String {
    case button, checkbox, color, date, email, file, hidden, string,
    image, month, number, password, radio, range, reset, search,
    submit, tel, text, time, url, week, datetimeLocal = "datetime-local"
}

public class Input: HTMLComponent {
    public init(
        _ cssClass: String?=nil,
        type: InputType,
        id: String,
        value: String?=nil,
        min: String?=nil,
        max: String?=nil,
        placeHolder: String?=nil,
        step: String?=nil,
        _ attributes: [String: String] = ["": ""]) {
        let combinedAttributes = attributes.merging(
            [
                "type": type.rawValue,
                "value": value,
                "min": min,
                "max": max,
                "placeholder": placeHolder,
                "step": step
            ].compactMap {
                guard let value = $0.value else {
                    return nil
                }
                return ($0.key, value)
            }
        , uniquingKeysWith: { $1 })
        
        super.init(
            .input,
            cssClass: cssClass,
            id: id,
            attributes: combinedAttributes,
            children: []
        )
    }
}
