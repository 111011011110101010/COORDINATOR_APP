import UIKit

final class DetailsCoordinator: Coordinator {
    
    
    
    var navigation: Navigation
    let factory: DetailsFactory
    var detailsScene: UIViewController?
    private weak var parentCoordinator: ParentCoordinator?
    
    init(navigation: Navigation, factory: DetailsFactory, parentCoordinator: ParentCoordinator?) {
        self.navigation = navigation
        self.factory = factory
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        
        detailsScene = factory.makeDetailsScene(delegate: self)
        guard let detailsScene else { return }
        navigation.pushViewController(detailsScene, animated: true) { [weak self] in
            guard let self else { return }
            self.parentCoordinator?.removeChildCoordinator(self)
        }
    }
}

extension DetailsCoordinator: DetailsSceneDelegate {
    
    func showPhotosScene() {
        navigation.present(factory.makePhotosScene(), animated: true)
    }
    
    func showMoreDetailsScene() {
        navigation.present(factory.makeMoreDetailsScene(), animated: true)
    }
    
    func showSourceScene() {
        navigation.present(factory.makeSourceScene(), animated: true)
    }
}
