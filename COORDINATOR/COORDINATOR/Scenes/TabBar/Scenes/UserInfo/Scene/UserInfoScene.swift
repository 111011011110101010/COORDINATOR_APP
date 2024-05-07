import UIKit

protocol UserInfoSceneDelegate: AnyObject {
    func tapUserInfoBarButton()
    func tapclose()
}

final class UserInfoScene: UIViewController {
    
    private weak var delegate: UserInfoSceneDelegate?
    
    init(delegate: UserInfoSceneDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScene()
        title = " USER INFO "
    }
    
}

private extension UserInfoScene {
    
    func configureScene() {
        
        self.view.backgroundColor = .systemYellow
        let personButtonAction = UIAction { [weak delegate] _ in
            delegate?.tapUserInfoBarButton()
        }
        let barButton = UIBarButtonItem(image: UIImage(systemName: "person.fill"), primaryAction: personButtonAction)
        navigationItem.rightBarButtonItem = barButton
        let closeAction = UIAction { [weak self] _ in
            
            self?.delegate?.tapclose()
        
        }
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark.circle.fill"), primaryAction: closeAction)
        navigationItem.leftBarButtonItem = closeButton
    }
}
