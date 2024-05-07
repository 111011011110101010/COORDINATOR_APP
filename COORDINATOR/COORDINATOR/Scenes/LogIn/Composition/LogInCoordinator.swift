import UIKit

protocol LogInCoordinatorDelegate {
    func didFinishFromLogInCoordinator()
}

class LogInCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: LogInFactory
    var delegate: LogInCoordinatorDelegate?
    
    init(navigation: Navigation, factory: LogInFactory, delegate: LogInCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let logInScene = factory.makeLoginScene(delegate: self)
        navigation.pushViewController(logInScene, animated: true)
    }
}

extension LogInCoordinator: LogInSceneDelegate {
    func didFinish() {
        delegate?.didFinishFromLogInCoordinator()
    }
}
