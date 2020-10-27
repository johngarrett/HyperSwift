import Foundation

enum InputType: String {
    case button, checkbox, color, date, email, file, hidden,
    image, month, number, password, radio, range, reset, search,
    submit, tel, text, time, url, week, datetimeLocal = "datetime-local"
}

public class Input: HTMLComponent {
    public init(
        _ cssClass: String="",
        id: String,
        value: String="",
        min: String="",
        max: String="",
        placeHolder: String="",
        step: String="",
        _ attributes: [String: String] = ["": ""]) {
        let combinedAttributes = attributes.merging([
            "id": id,
            "value": value,
            "min": min,
            "max": max,
            "placeholder": placeHolder,
            "step": step
        ], uniquingKeysWith: { $1 })
        
        super.init(
            .input,
            cssClass: cssClass,
            attributes: combinedAttributes,
            nil
        )
    }
}
