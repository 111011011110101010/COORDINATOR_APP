import UIKit

final class MyPostCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: MyPostsFactory
    private var mediator: MyPostMediator?
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: MyPostsFactory, mediator: MyPostMediator?) {
        self.navigation = navigation
        self.factory = factory
        self.mediator = mediator
    }
    
    func start() {
        
        let myPostsScene = factory.makeMyPostsScene(delegate: self)
        navigation.pushViewController(myPostsScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
        factory.makeTabBarItem(navigation: navigation)
    }
}

extension MyPostCoordinator: MyPostScenesDelegate {
    
    func didSelectPost(id: Int) {
        let detailCoordinator = factory.makeDetailCoordinator(navigation: navigation, id: id, parentCoordinator: self)
        addChildCoordinator(detailCoordinator)
    }
    
    func didTapAddNewPostButton() {
        let newPostScene = factory.makeNewPost(delegate: self)
        navigation.present(newPostScene, animated: true)
    }
}

extension MyPostCoordinator: NewPostScenesDelegate {
    
    func didSaveNewPost(title: String) {
        navigation.dismiss(animated: true)
        mediator?.updateController(title: title, navigation: navigation)
    }
}

extension MyPostCoordinator: ParentCoordinator {}
