import UIKit

struct TabBarFactory {
    
    let appDIContainer: AppDIContainer?
    
    func makeTabBarScene() -> UITabBarController {
        let tabBarScene = TabBarScene()
        return tabBarScene
    }
    
    func makeChildCoordinator(delegate: SettingsCoordinatorDelegate) -> [Coordinator] {
        let settingsCoordinator = makeSettingsCoordinator(delegate: delegate)
        let communitiesCoordinator = makeCommunitiesCoordinator()
        let myPostCoordinator = makeMyPostCoordinator()
        let homeCoordinator = makeHomeCoordinator()
        
        return [homeCoordinator, myPostCoordinator, settingsCoordinator, communitiesCoordinator]
    }
    
   private func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate) -> Coordinator {
        let factory = SettingsFactory(appDIContainer: appDIContainer)
        let navigation = NavigationImplementation(rootViewController: UINavigationController())
        return SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }    
    
   private func makeCommunitiesCoordinator() -> Coordinator {
        let factory = CommunitiesFactoryImplemenattion()
       let navigation = NavigationImplementation(rootViewController: UINavigationController())
        return CommunitiesCoordinator(navigation: navigation, factory: factory)
    }
    
    private func makeMyPostCoordinator() -> Coordinator {
        let factory = MyPostsFactory()
        let mediator = MyPostMediatorImplementation()
        let navigation = NavigationImplementation(rootViewController: UINavigationController())
        return MyPostCoordinator(navigation: navigation,
                                 factory: factory,
                                 mediator: mediator)
    }
    
    private func makeHomeCoordinator() -> Coordinator {
        let factory = HomeFactory()
        let navigation = NavigationImplementation(rootViewController: UINavigationController())
        return HomeCoordinator(navigation: navigation, factory: factory)
    }
}
