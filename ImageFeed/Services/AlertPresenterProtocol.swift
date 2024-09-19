
import Foundation

protocol AlertPresenterProtocol: AnyObject {
    func showSplashView(_ result: AlertModelOneButton)
    func showOneButton(_ result: AlertModelOneButton)
    func showTwoButton(_ result: AlertModelTwoButton)
}
