import UIKit

protocol HomeSceneDelegate: AnyObject {
    func didTapCellHomeScene(id: Int)
}

final class HomeScene: UICollectionViewController {
    
    private weak var delegate: HomeSceneDelegate?
    
    init(delegate: HomeSceneDelegate?, flowLayout: UICollectionViewFlowLayout) {
        self.delegate = delegate
        super.init(collectionViewLayout: flowLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationCollectionView()
    }
    
}

extension HomeScene {
    
    func configurationCollectionView() {
        collectionView.backgroundColor = .green
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Id")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Id", for: indexPath)
        var defaultConfiguration = UIListContentConfiguration.cell()
        defaultConfiguration.text = "Cell - \(indexPath.item)"
        defaultConfiguration.secondaryText = "Please TAP for me"
        defaultConfiguration.image = UIImage(systemName: "person.circle")
        cell.contentConfiguration = defaultConfiguration
        cell.layer.borderWidth = 2
        cell.layer.borderColor = .init(red: 230/255, green: 12/255, blue: 4/255, alpha: 1)
        cell.backgroundColor = .cyan
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapCellHomeScene(id: indexPath.row)
    }
    
}
