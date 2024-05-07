import UIKit

final class CommunitiesCoordinator: Coordinator {
    var navigation: Navigation
    var factory: CommunitiesFactory
    
    init(navigation: Navigation, factory: CommunitiesFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let communitiesScene = factory.makeCommunitiesScene()
        navigation.pushViewController(communitiesScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
        factory.makeItemTabBar(navigation: navigation)
    }
}
