import UIKit

extension SettingsCoordinator: SettingsSceneDelegate {
    func didFinishSettingsScene(navigationNext: SettingsNavigation) {
        
        switch navigationNext {
            
        case .userInfo:
            configurationUserInfo()
        case .account:
            navigation.pushViewController(factory.makeAccountScene(), animated: true)
        case .theme:
            navigation.pushViewController(factory.makeThemeScene(), animated: true)
        case .logOut:
            delegate?.didFinishFromSettingsCoordinator()
        case .version:
            break
        }
    }
    
    func configurationUserInfo() {
        let userInfoCoordinator = factory.makeUserInfoCoordinator(delegate: self)
        userInfoCoordinator.start()
        navigation.present(userInfoCoordinator.navigation.rootViewController, animated: true)
        addChildCoordinator(userInfoCoordinator)
    }
}

extension SettingsCoordinator: UserInfoCoordinatorDelegate {
    
    func didTapCloseFromCoordinatorInfo(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
        navigation.dismiss(animated: true)
        navigation.dismissNavigation = nil
    }
    
}
