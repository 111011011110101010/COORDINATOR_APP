import UIKit

protocol MyPostMediator {
    func updateController(title: String, navigation: Navigation)
}

struct MyPostMediatorImplementation: MyPostMediator {
    
    func updateController(title: String, navigation: Navigation) {
        
        guard let myPostsScene = navigation.rootViewController.topViewController as? MyPostScenes else { return }
        myPostsScene.updateLabel(title: title)
        
    }
}
