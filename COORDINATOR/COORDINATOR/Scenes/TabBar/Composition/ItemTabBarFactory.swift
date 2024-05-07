import UIKit

protocol ItemTabBarFactory {}
extension ItemTabBarFactory {
    
     func makeItemTabBar(navigation: Navigation, title: String, image: String, selectedImage: String) {
        
        let itemTabBar = UITabBarItem(title: title,
                                      image: UIImage(systemName: image),
                                      selectedImage: UIImage(systemName: selectedImage))
         navigation.rootViewController.tabBarItem = itemTabBar
    }
}
