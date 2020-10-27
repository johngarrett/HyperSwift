import Foundation

public enum InputType: String {
    case button, checkbox, color, date, email, file, hidden, string,
    image, month, number, password, radio, range, reset, search,
    submit, tel, text, time, url, week, datetimeLocal = "datetime-local"
}

public class Input: HTMLComponent {
    public init(
        _ cssClass: String="",
        type: InputType,
        id: String,
        value: String="",
        min: String="",
        max: String="",
        placeHolder: String="",
        step: String="",
        _ attributes: [String: String] = ["": ""]) {
        let combinedAttributes = attributes.merging([
            "type": type.rawValue,
            "value": value,
            "min": min,
            "max": max,
            "placeholder": placeHolder,
            "step": step
        ], uniquingKeysWith: { $1 })
        
        super.init(
            .input,
            cssClass: cssClass,
            id: id,
            attributes: combinedAttributes,
            nil
        )
    }
}
