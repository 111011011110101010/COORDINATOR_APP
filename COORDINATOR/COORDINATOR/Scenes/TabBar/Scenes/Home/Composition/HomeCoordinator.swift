import UIKit

final class HomeCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: HomeFactory
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: HomeFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        
        let homeScene = factory.makeHomeScene(delegate: self)
        navigation.pushViewController(homeScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
        factory.makeItemTabBar(navigation: navigation)
        
    }
}

extension HomeCoordinator: HomeSceneDelegate {
    func didTapCellHomeScene(id: Int) {
       let detailCoordinator = factory.makeDetailCoordinator(navigation: navigation, id: id, parentCoordinator: self)
        addChildCoordinator(detailCoordinator)
    }
}

extension HomeCoordinator: ParentCoordinator {}
