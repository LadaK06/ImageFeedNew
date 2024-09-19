
import UIKit

struct AlertModelOneButton {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
}


struct AlertModelTwoButton {
    let title: String
    let message: String
    let buttonTextOne: String
    let buttonTextTwo: String
    let completionOne: (() -> Void)?
    let completionTwo: (() -> Void)?
}
