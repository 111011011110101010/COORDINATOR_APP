import UIKit

protocol LogInSceneDelegate: AnyObject {
    func didFinish()
}

class LogInScene: UIViewController {
    
    private var viewModel: LoginViewModel?
    private weak var delegate: LogInSceneDelegate?
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "     LogIn     "
        configuration.baseBackgroundColor = .systemGray
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.textColor = .white
        label.text = "COORDINATOR"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let labelDevelopmentBy: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.textColor = .white.withAlphaComponent(0.2)
        label.text = "developed by Zaharchenko"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let baseView: UIImageView = {
        let view = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        view.image = UIImage(named: "BackGroundView")
        
        return view
    }()
    
    init(viewModel: LoginViewModel?, delegate: LogInSceneDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addAction()
    }
}

private extension LogInScene {
    
    func setupUI() {
        self.view.addSubview(baseView)
        self.baseView.addSubview(label)
        self.baseView.addSubview(labelDevelopmentBy)
        self.view.addSubview(button)
        
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150).isActive = true
        
        labelDevelopmentBy.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        labelDevelopmentBy.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -35).isActive = true
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200).isActive = true
    }
    
    func addAction() {
        let action = UIAction { [weak viewModel, delegate] _ in
            viewModel?.logIn()
            delegate?.didFinish()
        }
        button.addAction(action, for: .touchUpInside)
    }
}
