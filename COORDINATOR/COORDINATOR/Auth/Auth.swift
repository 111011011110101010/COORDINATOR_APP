import UIKit

protocol AuthSession {
    var isSessionActive: Bool { get }
}

protocol LogIn {
    func logIn()
}

protocol LogOut {
    func logOut()
}

class Auth {
    private var session: Bool = false
}

extension Auth: AuthSession {
    var isSessionActive: Bool {
        session
    }
}

extension Auth: LogIn {
    func logIn() {
        self.session = true
    }
}

extension Auth: LogOut {
    func logOut() {
        self.session = false
    }
}
