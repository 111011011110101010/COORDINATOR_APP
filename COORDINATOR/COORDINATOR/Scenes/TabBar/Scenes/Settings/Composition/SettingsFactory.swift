import UIKit

struct SettingsFactory: ItemTabBarFactory {
    let appDIContainer: AppDIContainer?
    
    func makeSetttingsScene(delegate: SettingsSceneDelegate) -> UIViewController {
        let viewModel = SettingsViewModel(auth: appDIContainer?.auth)
        let settingScene = SettingsScene(viewModel: viewModel, delegate: delegate)
        settingScene.title = "Settings"
        return settingScene
    }
    
    func makeAccountScene() -> UIViewController {
        let accountScene = ExampleScene()
        accountScene.view.backgroundColor = .green
        accountScene.title = "Account"
        
        return accountScene
    }
    
    func makeThemeScene() -> UIViewController {
        let themeScene = ExampleScene()
        themeScene.view.backgroundColor = .red
        themeScene.title = "Theme"
        
        return themeScene
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Settings",
                       image: "gearshape.2",
                       selectedImage: "gearshape.2.fill")
    }
    
    func makeUserInfoCoordinator(delegate: UserInfoCoordinatorDelegate) -> Coordinator {
        let factory = UserInfoFactory()
        let navigation = UINavigationController()
        navigation.modalPresentationStyle = .fullScreen
        let navigationImp = NavigationImplementation(rootViewController: navigation)
        navigationImp.rootViewController.title = "User Info"
        return UserInfoCoordinator(navigation: navigationImp, factory: factory, delegate: delegate)
    }
    
}
