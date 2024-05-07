import UIKit

class AppCoordinator: Coordinator {
    
    var navigation: Navigation
    var window: UIWindow?
    var factory: AppFactory?
    var auth: Auth?
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, window: UIWindow?, factory: AppFactory?, auth: Auth?) {
        self.navigation = navigation
        self.window = window
        self.factory = factory
        self.auth = auth
    }
    
    func start() {
        configureWindow()
        launchSomeCoordinator()
    }
}

private extension AppCoordinator {
    
    func configureWindow() {
        self.window?.rootViewController = navigation.rootViewController
        self.window?.makeKeyAndVisible()
    }
    
    func launchSomeCoordinator() {
        guard let auth else { return }
        auth.isSessionActive ? launchTabBarCoordinator() : launchLogInCoordinator()
    }
    
    func launchLogInCoordinator() {
        let logInCoordinator = factory?.makeLogInCoordinator(navigation: navigation, delegate: self)
        addChildCoordinator(logInCoordinator)
    }
    
    func launchTabBarCoordinator() {
        let tabBarCoordinator = factory?.makeTabBarCoordinator(navigation: navigation, delegate: self)
        addChildCoordinator(tabBarCoordinator)
    }
    
    func removeAllCoordinatorsAndStartIt() {
        navigation.viewControllers = []
        clearAllChildCoordinators()
        launchSomeCoordinator()
    }
}




extension AppCoordinator: LogInCoordinatorDelegate {
    func didFinishFromLogInCoordinator() {
        removeAllCoordinatorsAndStartIt()
    }
}

extension AppCoordinator: TabBarCoordinatorDelegate {
    func didFinishTabBarCoordintor() {
        removeAllCoordinatorsAndStartIt()
    }
}

extension AppCoordinator: ParentCoordinator {}
