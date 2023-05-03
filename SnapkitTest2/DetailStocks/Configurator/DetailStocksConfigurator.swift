//  
//  DetailStocksConfigurator.swift
//  SnapkitTest2
//
//  Created by Bohdan on 02.05.2023.
//

import Foundation

protocol DetailStocksConfiguratorType {
    func configure(viewController: DetailStocksViewController)
}

class DetailStocksConfigurator: DetailStocksConfiguratorType {
    
    // MARK: - Protocol property
    
    // MARK: - Protocol method
    func configure(viewController: DetailStocksViewController) {
        let interactor = DetailStocksInteractor()
        let router = DetailStocksRouter(viewController: viewController)
        let presenter = DetailStocksPresenter(view: viewController, interactor: interactor, router: router)
        viewController.presenter = presenter
    }
}
