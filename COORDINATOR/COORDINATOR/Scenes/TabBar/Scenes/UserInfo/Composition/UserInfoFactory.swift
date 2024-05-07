import UIKit

struct UserInfoFactory {
    
    func makeUserInfoScene(delegate: UserInfoSceneDelegate) -> UIViewController {
        return UserInfoScene(delegate: delegate)
    }
    
    func makePersonScene() -> UIViewController {
        let personScene = ExampleScene()
        personScene.view.backgroundColor = .systemGreen
        personScene.title = "Person Info"

        return personScene
    }
}
