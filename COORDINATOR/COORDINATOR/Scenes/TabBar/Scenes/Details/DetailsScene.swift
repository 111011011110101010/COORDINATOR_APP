import UIKit

protocol DetailsSceneDelegate: AnyObject {
    
    func showPhotosScene()
    func showMoreDetailsScene()
    func showSourceScene()
    
}

final class DetailsScene: UIViewController {
    
    private weak var delegate: DetailsSceneDelegate?
    
    init(delegate: DetailsSceneDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let photosButton: UIButton = {
        let button = UIButton(type: .system)
        var defautl = UIButton.Configuration.filled()
        defautl.title = "Photos"
        defautl.baseBackgroundColor = .red
        button.configuration = defautl
        
        return button
    }()
    
    private let moreDetailsButton: UIButton = {
        let button = UIButton(type: .system)
        var defautl = UIButton.Configuration.filled()
        defautl.title = "More Details"
        defautl.baseBackgroundColor = .green
        button.configuration = defautl
        
        return button
    }()
    
    private let sourceButton: UIButton = {
        let button = UIButton(type: .system)
        var defautl = UIButton.Configuration.filled()
        defautl.title = "Source"
        defautl.baseBackgroundColor = .orange
        button.configuration = defautl
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension DetailsScene {
    
    func setupUI() {
        
        let stackView = UIStackView(arrangedSubviews: [photosButton, moreDetailsButton, sourceButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        self.view.addSubview(stackView)

        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.backgroundColor = .darkGray
        
        setupAction()
    }
    
    func setupAction() {
        
        let photosButtonAction = UIAction { [weak self] _ in
            self?.delegate?.showPhotosScene()
        }
        
        let moreDetailsAction = UIAction { [weak self] _ in
            self?.delegate?.showMoreDetailsScene()
        }
        
        let sourceButtonAction = UIAction { [weak self] _ in
            self?.delegate?.showSourceScene()
        }
        
        self.photosButton.addAction(photosButtonAction, for: .touchUpInside)
        self.moreDetailsButton.addAction(moreDetailsAction, for: .touchUpInside)
        self.sourceButton.addAction(sourceButtonAction, for: .touchUpInside)
        
    }
}
