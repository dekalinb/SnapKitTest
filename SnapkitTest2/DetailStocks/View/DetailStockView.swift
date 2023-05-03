//
//  DetailStockView.swift
//  SnapkitTest2
//
//  Created by Bohdan on 02.05.2023.
//

import SnapKit
import SwiftUI

final class DetailStocksView: UIView {
    struct DisplayModel {
        let image: UIImage?
    }
    
    lazy var scrollView = UIScrollView()
    lazy var productImageView = UIImageView()
    lazy var procentView = UIView()
    lazy var procentLabel = UILabel()
    lazy var nameLabel = UILabel()
    lazy var weightLabel = UILabel()
    lazy var priceLabel = UILabel()
    lazy var currencyLabel = UILabel()
    var someButton = UIButton(type: .infoDark)
    lazy var tableView = UITableView()
    
    @objc var onTapButton: (() -> Void)?
    
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
private extension DetailStocksView {
    func setupLayout() {
        setupScrollView()
        setupProductImageView()
        setupProcentView()
        setupProcentLabel()
        setupNameLabel()
        setupWeightLabel()
        setupPriceLabel()
        setupCurrencyLabel()
        
        
        someButton.setTitle("BUTTON", for: .normal)
//        someButton.backgroundColor = .blue
        scrollView.addSubview(someButton)
        someButton.addTarget(self,
                             action: #selector(getter: onTapButton),
                             for: .touchUpInside)
        
        someButton.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
    
    func setupScrollView() {
        addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupProductImageView() {
//        productImageView.backgroundColor = .red
        addSubview(productImageView)
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupProcentView() {
        procentView.layer.cornerRadius = 4
        procentView.backgroundColor = .systemOrange
        addSubview(procentView)
        
        procentView.snp.makeConstraints { make in
            make.bottom.equalTo(productImageView.snp.top).inset(50)
            make.height.equalTo(29)
            make.width.equalTo(50)
            make.left.equalTo(productImageView.snp.left).inset(-20)
        }
    }
    
    func setupProcentLabel() {
        procentLabel.textColor = .white
        procentLabel.text = "-25%"
        procentLabel.font = .systemFont(ofSize: 14)
        procentLabel.textAlignment = .center
        procentView.addSubview(procentLabel)
        
        procentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupNameLabel() {
        nameLabel.text = "Масло Харківське солодковешкове екстра 81,5%"
        nameLabel.numberOfLines = 2
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).inset(-18)
            make.left.right.equalToSuperview().inset(32)
        }
    }
    
    func setupWeightLabel() {
        weightLabel.text = "200 г"
        weightLabel.font = .systemFont(ofSize: 16, weight: .thin)
        addSubview(weightLabel)
        
        weightLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom)
        }
    }
    
    func setupPriceLabel() {
        priceLabel.text = "55.90"
        priceLabel.font = .boldSystemFont(ofSize: 22)
        addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(priceLabel.snp.bottom)
        }
    }
    
    func setupCurrencyLabel() {
        
    }
}

struct TaskListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            let view = DetailStocksView()
            view.render(props:
                            DetailStocksView.DisplayModel(image: UIImage(named: "prod_image")))
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
    }
}
