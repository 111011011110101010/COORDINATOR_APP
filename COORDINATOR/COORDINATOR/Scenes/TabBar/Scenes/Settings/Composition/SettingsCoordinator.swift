import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {
    func didFinishFromSettingsCoordinator()
}

final class SettingsCoordinator: Coordinator {
    var navigation: Navigation
    var factory: SettingsFactory
    weak var delegate: SettingsCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []

    init(navigation: Navigation, factory: SettingsFactory, delegate: SettingsCoordinatorDelegate?) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let settingsScene = factory.makeSetttingsScene(delegate: self)
        factory.makeItemTabBar(navigation: navigation)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(settingsScene, animated: true)
    }
}

extension SettingsCoordinator: ParentCoordinator {}
