//
//  DetailStockView.swift
//  SnapkitTest2
//
//  Created by Bohdan on 02.05.2023.
//

import SnapKit
import SwiftUI

final class DetailStocksContentView: UIView {
    struct DisplayModel {
        let image: UIImage?
    }
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var productImageView = UIImageView()
    private var procentView = UIView()
    private var procentLabel = UILabel()
    private var nameLabel = UILabel()
    private var weightLabel = UILabel()
    private var priceLabel = UILabel()
    private var currencyLabel = UILabel()
    private var oldPriceLabel = UILabel()
    private var oldCurrencyLabel = UILabel()
    private var crossView = UIView()
    private var buyButton = Button(type: .system)
    private var availableLabel = UILabel()
    private var countLabel = UILabel()
    private var otherStorsButton = Button(type: .system)
    private var similarStocksCollectionView = HorisontalCollectionView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    func render(props: DisplayModel) {
        productImageView.image = props.image
    }
}

// MARK: - Setup layout
private extension DetailStocksContentView {
    func setupLayout() {
        setupScrollView()
        setupContentView()
        setupProductImageView()
        setupProcentView()
        setupProcentLabel()
        setupNameLabel()
        setupWeightLabel()
        setupPriceLabel()
        setupCurrencyLabel()
        setupOldPriceLabel()
        setupOldCurrencyLabel()
        setupCrossView()
        setupBuyButton()
        setupAvailableLabel()
        setupCountLabel()
        setupOtherStorsButton()
        setupSimilarStocksCollectionView()
    }

    func setupScrollView() {
        addSubview(scrollView, configure: { view in
            view.showsVerticalScrollIndicator = false
            
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        })
    }
    
    func setupContentView() {
        scrollView.addSubview(contentView) { view in
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
                make.height.greaterThanOrEqualToSuperview()
            }
        }
    }
    
    func setupProductImageView() {
        contentView.addSubview(productImageView, configure: { view in
            view.snp.makeConstraints { make in
                make.top.equalTo(safeAreaInsets.top).inset(30)
                make.left.right.equalToSuperview().inset(50)
                make.centerX.equalToSuperview()
            }
        })
    }
    
    func setupProcentView() {
        contentView.addSubview(procentView, configure: { view in
            view.layer.cornerRadius = 4
            view.backgroundColor = .systemOrange
            
            view.snp.makeConstraints { make in
                make.bottom.equalTo(productImageView.snp.topMargin).inset(40)
                make.height.equalTo(29)
                make.width.equalTo(50)
                make.left.equalTo(productImageView.snp.left).inset(-20)
            }
        })
    }
    
    func setupProcentLabel() {

        procentView.addSubview(procentLabel, configure: { view in
            view.textColor = .white
            view.text = "-25%"
            view.font = .systemFont(ofSize: 14)
            view.textAlignment = .center
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        })
    }
    
    func setupNameLabel() {
        contentView.addSubview(nameLabel, configure: { view in
            view.text = "Масло Харківське солодковешкове екстра 81,5%"
            view.numberOfLines = 2
            view.textStyle = .systemFont(ofSize: 16, weight: .semibold)
            view.snp.makeConstraints { make in
                make.top.equalTo(productImageView.snp.bottom).inset(-18)
                make.left.right.equalToSuperview().inset(32)
            }
        })
    }
    
    func setupWeightLabel() {
        contentView.addSubview(weightLabel, configure: { view in
            view.text = "200 г"
            view.font = .systemFont(ofSize: 16, weight: .thin)
            view.snp.makeConstraints { make in
                make.left.equalTo(nameLabel.snp.left)
                make.top.equalTo(nameLabel.snp.bottom)
            }
        })
    }
    
    func setupPriceLabel() {
        contentView.addSubview(priceLabel, configure: { view in
            priceLabel.text = "55.90"
            priceLabel.font = .systemFont(ofSize: 22, weight: .black)
            priceLabel.snp.makeConstraints { make in
                make.left.equalTo(nameLabel.snp.left)
                make.top.equalTo(nameLabel.snp.bottom).inset(-30)
            }
        })
    }
    
    func setupCurrencyLabel() {
        contentView.addSubview(currencyLabel, configure: { view in
            view.text = "₴"
            view.font = .systemFont(ofSize: 17, weight: .bold)
            view.snp.makeConstraints { make in
                make.left.equalTo(priceLabel.snp.right)
                make.bottom.equalTo(priceLabel.snp.bottom)
            }
        })
    }
    
    func setupOldPriceLabel() {
        contentView.addSubview(oldPriceLabel) { view in
            view.text = "74.75"
            view.textColor = .systemGray2
            view.font = .boldSystemFont(ofSize: 17)
            
            view.snp.makeConstraints { make in
                make.left.equalTo(currencyLabel.snp.right).inset(-20)
                make.bottom.equalTo(currencyLabel.snp.bottom)
            }
        }
    }
    
    func setupOldCurrencyLabel() {
        contentView.addSubview(oldCurrencyLabel) { view in
            view.text = "₴"
            view.textColor = .systemGray2
            view.font = .systemFont(ofSize: 12, weight: .bold)
            
            view.snp.makeConstraints { make in
                make.left.equalTo(oldPriceLabel.snp.right)
                make.bottom.equalTo(oldPriceLabel.snp.bottom)
            }
        }
    }
    
    func setupCrossView() {
        contentView.addSubview(crossView) { view in
            view.transform = CGAffineTransform(rotationAngle: -(.pi / 13))
            view.backgroundColor = .systemGray2
            
            view.snp.makeConstraints { make in
                make.height.equalTo(2)
                make.left.equalTo(oldPriceLabel.snp.left)
                make.right.equalTo(oldCurrencyLabel.snp.right)
                make.centerY.equalTo(oldPriceLabel)
            }
        }
    }
    
    func setupBuyButton() {
        contentView.addSubview(buyButton) { view in
            view.titleLabel?.font = .systemFont(ofSize: 14, weight: .black)
            view.tintColor = .white
            view.layer.cornerRadius = 25
            view.setTitle("КУПИТИ", for: .normal)
            view.backgroundColor = .systemOrange
            
            view.snp.makeConstraints { make in
                make.top.equalTo(oldPriceLabel.snp.bottom).inset(-18)
                make.right.left.equalToSuperview().inset(24)
                make.height.equalTo(50)
            }
        }
    }
    
    func setupAvailableLabel() {
        contentView.addSubview(availableLabel) { view in
            view.text = "В наявностi"
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            view.textColor = .systemGreen
            
            view.snp.makeConstraints { make in
                make.left.equalTo(buyButton.snp.left)
                make.top.equalTo(buyButton.snp.bottom).inset(-26)
            }
        }
    }
    
    func setupCountLabel() {
        contentView.addSubview(countLabel) { view in
            view.text = "21 од."
            view.font = .systemFont(ofSize: 16, weight: .semibold)
            view.textColor = .systemGreen
            
            view.snp.makeConstraints { make in
                make.left.equalTo(availableLabel.snp.right).inset(-4)
                make.bottom.equalTo(availableLabel.snp.bottom)
            }
        }
    }
    
    func setupOtherStorsButton() {
        contentView.addSubview(otherStorsButton) { view in
            view.setTitle("В iнших магазинах")
            view.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
            view.tintColor = .systemOrange
            
            view.snp.makeConstraints { make in
                make.right.equalTo(buyButton.snp.right)
                make.centerY.equalTo(availableLabel)
            }
        }
    }
    
    func setupSimilarStocksCollectionView() {
        contentView.addSubview(similarStocksCollectionView) { view in
            view.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(212).priority(.low)
                make.top.equalTo(otherStorsButton).inset(48)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(scrollView.snp.bottom).priority(.high)
            }
        }
    }
}

struct DetailStockViewProvider: PreviewProvider {
    static var previews: some View {
        Preview {
            let view = DetailStocksContentView()
            view.render(props: .init(image:  UIImage(named: "prod_image")))
            return view
        }
    }
}

//struct DetailStockViewProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView()
//    }
//
//    struct ContainerView: UIViewRepresentable {
//        func makeUIView(context: Context) -> some UIView {
//            let view = DetailStocksContentView()
//            view.render(props:
//                            DetailStocksContentView.DisplayModel(image: UIImage(named: "prod_image")))
//            return view
//        }
//
//        func updateUIView(_ uiView: UIViewType, context: Context) {
//        }
//    }
//}
