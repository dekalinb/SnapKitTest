import SnapKit
import SwiftUI


final class HorisontalCollectionView: UIView {
    struct DisplayModel {
    }
    
    private lazy var titleLabel = UILabel()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 295, height: 128)
        layout.sectionInset.left = 24
        layout.sectionInset.right = 24
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    func render(props: DisplayModel) {
    }
}

// MARK: - Setup layout
private extension HorisontalCollectionView {
    func setupLayout() {
        backgroundColor = .systemGray6
        
        setupTitleLabel()
        setupCollectionView()
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel) { view in
            view.text = "СХОЖІ АКЦІЇ"
            view.font = .systemFont(ofSize: 17, weight: .heavy)
            
            view.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(16)
                make.left.right.equalToSuperview().inset(24)
            }
        }
    }
    
    func setupCollectionView() {
        addSubview(collectionView) { view in
            view.clipsToBounds = false
            view.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(52)
                make.bottom.equalToSuperview().inset(32)
                make.left.right.equalToSuperview()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HorisontalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Здесь нужно вернуть количество ячеек
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        
        cell.layer.cornerRadius = 6
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        cell.layer.shadowOpacity = 3
        cell.layer.shadowRadius = 10
        cell.layer.shadowOffset = CGSize(width: 4, height: 4)
        // Здесь нужно настроить ячейку
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HorisontalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

struct HorisontalCollectionProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().previewLayout(.fixed(width: 375, height: 212))
    }
    
    struct ContainerView: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            let view = HorisontalCollectionView()
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
    }
}
