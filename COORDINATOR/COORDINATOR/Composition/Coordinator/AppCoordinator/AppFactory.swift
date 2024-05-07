import UIKit

struct AppFactory {
    var appDIContainer: AppDIContainer?
    
    func makeLogInCoordinator(navigation: Navigation, delegate: LogInCoordinatorDelegate) -> Coordinator {
        let factory = LogInFactory(appDIContainer: appDIContainer)
        return LogInCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
    
    func makeTabBarCoordinator(navigation: Navigation, delegate: TabBarCoordinatorDelegate) -> Coordinator {
        let factory = TabBarFactory(appDIContainer: appDIContainer)
        return TabBarCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
    
}
