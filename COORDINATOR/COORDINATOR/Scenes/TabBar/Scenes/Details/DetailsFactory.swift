import UIKit

struct DetailsFactory {
    
    private(set) var id: Int
    
    func makeDetailsScene(delegate: DetailsSceneDelegate) -> UIViewController {
        let detailsScene = DetailsScene(delegate: delegate)
        detailsScene.title = "Post - \(id)"
        return detailsScene
    }
    
    func makePhotosScene() -> UIViewController {
        let photosScene = ExampleScene()
        photosScene.title = "Photos from Post - \(id)"
        photosScene.view.backgroundColor = .red
        let navigation = UINavigationController(rootViewController: photosScene)
        navigation.navigationBar.prefersLargeTitles = true
        
        return navigation
    }
    
    func makeMoreDetailsScene() -> UIViewController {
        let moreDetailsScene = ExampleScene()
        moreDetailsScene.title = "More Details from Post - \(id)"
        moreDetailsScene.view.backgroundColor = .green
        let navigation = UINavigationController(rootViewController: moreDetailsScene)
        navigation.navigationBar.prefersLargeTitles = true
        
        return navigation
    }
    
    func makeSourceScene() -> UIViewController {
        let sourceScene = ExampleScene()
        let barButton = UIBarButtonItem(image: UIImage(systemName: "person"))   
        sourceScene.navigationItem.rightBarButtonItem = barButton
        sourceScene.title = "Source from Post - \(id)"
        sourceScene.view.backgroundColor = .orange
        let navigation = UINavigationController(rootViewController: sourceScene)
        navigation.navigationBar.prefersLargeTitles = true

        return navigation
    }
    
}
