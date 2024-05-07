import UIKit

protocol TabBarCoordinatorDelegate: AnyObject {
    func didFinishTabBarCoordintor()
}

class TabBarCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: TabBarFactory
    private weak var delegate: TabBarCoordinatorDelegate?
    private var childCoordinators: [Coordinator] = []
 
    
    init(navigation: Navigation, factory: TabBarFactory, delegate: TabBarCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let tabBarScene = factory.makeTabBarScene()
        navigation.navigationBar.isHidden = true
        navigation.pushViewController(tabBarScene, animated: true)
        
        childCoordinators = factory.makeChildCoordinator(delegate: self)
        let childNavigation = childCoordinators.map { $0.navigation.rootViewController }
        tabBarScene.viewControllers = childNavigation
        childCoordinators.forEach { $0.start() }
    }
}

extension TabBarCoordinator: SettingsCoordinatorDelegate {
    func didFinishFromSettingsCoordinator() {
        childCoordinators = []
        delegate?.didFinishTabBarCoordintor()
    }
}

