//
//  CustomCell.swift
//  SnapkitTest2
//
//  Created by Bohdan on 03.05.2023.
//

import SnapKit
import SwiftUI

// MARK: - MyCell
final class MyCell: UICollectionViewCell {
    
    private lazy var image = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var oldPriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Здесь нужно настроить внешний вид ячейки
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout
private extension MyCell {
    func setupLayout() {
        backgroundColor = .white
        
        addSubview(image) { view in
            view.image = UIImage(named: "prod_image2")
            
            view.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(16)
                make.top.bottom.equalToSuperview().inset(14)
                make.width.equalTo(view.snp.height)
            }
        }
        
        addSubview(titleLabel) { view in
            view.text = "Десерт Точно Молочно Perfe..."
            view.font = .systemFont(ofSize: 16, weight: .semibold)
            view.numberOfLines = 2
            
            view.snp.makeConstraints { make in
                make.left.equalTo(image.snp.right).inset(-16)
                make.top.equalToSuperview().inset(23)
                make.right.equalToSuperview().inset(32)
            }
        }
        
        addSubview(priceLabel) { view in
            view.text = "₴22,50"
            view.font = .systemFont(ofSize: 17, weight: .heavy)
            view.textColor = .systemGreen
            
            view.snp.makeConstraints { make in
                make.left.right.equalTo(titleLabel)
                make.top.equalTo(titleLabel.snp.bottom).inset(-4)
            }
        }
        
        addSubview(oldPriceLabel) { view in
            view.text = "₴74.75"
            view.textColor = .systemGray2
            view.font = .boldSystemFont(ofSize: 14)
            
            view.snp.makeConstraints { make in
                make.left.right.equalTo(titleLabel)
                make.top.equalTo(priceLabel.snp.bottom)
            }
        }
    }
}

struct MyCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().previewLayout(.fixed(width: 295, height: 129))
    }
    
    struct ContainerView: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            let view = MyCell()
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
    }
}
