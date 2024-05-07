import UIKit

protocol CommunitiesFactory {
    func makeCommunitiesScene() -> UIViewController
    func makeItemTabBar(navigation: Navigation)
}

struct CommunitiesFactoryImplemenattion: CommunitiesFactory {
    
    func makeCommunitiesScene() -> UIViewController {
        let communitiesScene = CommunitiesScene()
        return communitiesScene
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Communities",
                       image: "person.3",
                       selectedImage: "person.3.fill")
    }
}

extension CommunitiesFactoryImplemenattion: ItemTabBarFactory {}
