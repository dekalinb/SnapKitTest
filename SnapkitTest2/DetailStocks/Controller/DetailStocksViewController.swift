//  
//  DetailStocksViewController.swift
//  SnapkitTest2
//
//  Created by Bohdan on 02.05.2023.
//

import UIKit

protocol DetailStocksViewType: AnyObject {
    
}

class DetailStocksViewController: UIViewController {
    
    private let contentView: DetailStocksContentView
    private var configurator: DetailStocksConfiguratorType = DetailStocksConfigurator()
    var presenter: DetailStocksPresenterType?
    
    init(contentView: DetailStocksContentView) {
        self.contentView = contentView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configurator.configure(viewController: self)
        presenter?.viewDidLoad()
        configureUI()
    }

}

// MARK: - DetailStocksViewType
extension DetailStocksViewController: DetailStocksViewType {
    
}

// MARK: - Private methods
private extension DetailStocksViewController {
    func configureUI() {
        setupButton()
    }
    
    func setupButton() {
//        contentView.someButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
//        contentView.tableView.delegate = self
//        contentView.onTapButton = { [unowned self] in
//            presenter?.didTapButton()
//        }
    }
    
    @objc func buttonDidTap() {
        print("Did Tap")
    }
}
