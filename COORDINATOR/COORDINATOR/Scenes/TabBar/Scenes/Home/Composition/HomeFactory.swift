import UIKit

struct HomeFactory: ItemTabBarFactory {
    
    func makeHomeScene(delegate: HomeSceneDelegate) -> UIViewController {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 130)
        
        let homeScene = HomeScene(delegate: delegate, flowLayout: flowLayout)
        homeScene.title = "Home"
        
        return homeScene
        
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Home",
                       image: "house",
                       selectedImage: "house.fill")
    }
    
    func makeDetailCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator) -> Coordinator {
        let factory = DetailsFactory(id: id)
        return DetailsCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
    }
    
}
