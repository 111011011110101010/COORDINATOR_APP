import UIKit

protocol MyPostScenesDelegate: AnyObject {
    func didSelectPost(id: Int)
    func didTapAddNewPostButton()
}

final class MyPostScenes: UICollectionViewController {
    
    private weak var delegate: MyPostScenesDelegate?
    private let label = UILabel()
    private var counter = 0
    
    init(delegate: MyPostScenesDelegate?, collectionViewLayout: UICollectionViewLayout) {
        self.delegate = delegate
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionViewCell()
    }
}

extension MyPostScenes {
    
    func setupUI() {
        
        
        
        let addAction = UIAction { [weak delegate] _ in
            delegate?.didTapAddNewPostButton()
        }
        
        let rightButtonAction = UIBarButtonItem(systemItem: .add, primaryAction: addAction)
        navigationItem.rightBarButtonItem = rightButtonAction
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }
    
    func configureCollectionViewCell() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Id")
        collectionView.backgroundColor = .white
    }
    
    func updateLabel(title: String) {
        label.text = title
        counter += 1
        collectionView.reloadData()
    }
}

extension MyPostScenes {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        counter
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Id", for: indexPath)
        var defaultConfiguration = UIListContentConfiguration.cell()
        defaultConfiguration.text = "Cell: \(indexPath.row)"
        defaultConfiguration.secondaryText = "Please, add your text"
        defaultConfiguration.image = UIImage(systemName: "person.crop.rectangle")
        cell.contentConfiguration = defaultConfiguration
        cell.backgroundColor = .yellow
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = .init(red: 250/255, green: 1/255, blue: 1/255, alpha: 1)
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectPost(id: indexPath.row)
    }
}
