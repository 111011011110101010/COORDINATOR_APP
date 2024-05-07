import UIKit

final class LoginViewModel {
    
    private var auth: LogIn?
    
    init(auth: LogIn? = nil) {
        self.auth = auth
    }
    
    func logIn() {
        self.auth?.logIn()
    }
    
}
