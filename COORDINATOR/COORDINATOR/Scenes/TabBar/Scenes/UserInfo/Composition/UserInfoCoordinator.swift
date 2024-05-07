import UIKit

protocol UserInfoCoordinatorDelegate: AnyObject {
    func didTapCloseFromCoordinatorInfo(childCoordinator: Coordinator)
}

final class UserInfoCoordinator: Coordinator {
    var navigation: Navigation
    private var factory: UserInfoFactory
    private weak var delegate: UserInfoCoordinatorDelegate?
    
    init(navigation: Navigation, factory: UserInfoFactory, delegate: UserInfoCoordinatorDelegate?) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
       let userInfoScene = factory.makeUserInfoScene(delegate: self)
        navigation.viewControllers = [userInfoScene]
        navigation.navigationBar.prefersLargeTitles = true
    
    }

}

extension UserInfoCoordinator: UserInfoSceneDelegate {
    
    func tapUserInfoBarButton() {
        let userInfoPersonScene = factory.makePersonScene()
        navigation.pushViewController(userInfoPersonScene, animated: true)
    }
    
    func tapclose() {
        delegate?.didTapCloseFromCoordinatorInfo(childCoordinator: self)
    }
}
