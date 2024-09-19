
import Foundation

var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM yyyy"
    formatter.locale = Locale(identifier: "ru_RU")
    return formatter
}()

extension Date {
    var dateTimeString: String { dateFormatter.string(from: self) }
}
