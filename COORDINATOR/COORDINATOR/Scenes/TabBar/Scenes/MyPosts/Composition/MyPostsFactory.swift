import UIKit

struct MyPostsFactory: ItemTabBarFactory {
    
    func makeMyPostsScene(delegate: MyPostScenesDelegate) -> UIViewController {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 200)
        
        let myPostsScene = MyPostScenes(delegate: delegate, collectionViewLayout: layout)
        myPostsScene.title = "Posts"
        myPostsScene.collectionView.backgroundColor = .systemMint
        return myPostsScene
    }
    
    func makeNewPost(delegate: NewPostScenesDelegate) -> UIViewController {
        return NewPostScene(delegate: delegate)
    }
    
    func makeTabBarItem(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Posts",
                       image: "person.2.crop.square.stack",
                       selectedImage: "person.2.crop.square.stack.fill")
    }
    
    func makeDetailCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator) -> Coordinator {
        let factory = DetailsFactory(id: id)
        return DetailsCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
    }
}
