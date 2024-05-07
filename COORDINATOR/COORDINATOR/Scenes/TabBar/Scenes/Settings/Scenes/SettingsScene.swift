import UIKit

protocol SettingsSceneDelegate: AnyObject {
    func didFinishSettingsScene(navigationNext: SettingsNavigation)
}

final class SettingsScene: UITableViewController {
    
    private var viewModel: SettingsViewModel
    private weak var delegate: SettingsSceneDelegate?
    
    init(viewModel: SettingsViewModel, delegate: SettingsSceneDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Id")
        tableView.backgroundColor = .systemGray
    }
    
}

extension SettingsScene {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.itemsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.getItems(row: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Id", for: indexPath)
        var defaultConfigurattion = cell.defaultContentConfiguration()
        defaultConfigurattion.text = viewModel.title
        defaultConfigurattion.image = UIImage(systemName: viewModel.icon)
        cell.contentConfiguration = defaultConfigurattion
        
        if !viewModel.isNavigable {
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = viewModel.cellSelected(row: indexPath.row)
        delegate?.didFinishSettingsScene(navigationNext: navigation)
    }
}

