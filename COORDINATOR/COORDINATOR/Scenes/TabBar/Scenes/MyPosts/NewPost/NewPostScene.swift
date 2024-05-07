import UIKit

protocol NewPostScenesDelegate: AnyObject {
    func didSaveNewPost(title: String)
}

final class NewPostScene: UIViewController {
    
    private weak var delegate: NewPostScenesDelegate?
    
    private let buttonSave: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Save"
        button.configuration = configuration
    
        return button
    }()
    
    init(delegate: NewPostScenesDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray2
        setupUI()
        configAction()
    }
    
    private func setupUI() {
        self.view.addSubview(buttonSave)
        
        buttonSave.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonSave.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private func configAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.didSaveNewPost(title: getString())
            
        }
        
        self.buttonSave.addAction(action, for: .touchUpInside)
    }
    
    private func getString() -> String {
        "Post - \(Int.random(in: 0...99))"
    }
}
