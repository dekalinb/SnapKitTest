//  
//  DetailStocksPresenter.swift
//  SnapkitTest2
//
//  Created by Bohdan on 02.05.2023.
//

import Foundation

protocol DetailStocksPresenterType {
    func viewDidLoad()
    func didTapButton()
}

class DetailStocksPresenter: DetailStocksPresenterType {
    
    private(set) weak var view: DetailStocksViewType?
    private(set) var interactor: DetailStocksInteractorType
    private(set) var router: DetailStocksRouterType
    
    // MARK: - Protocol property
    
    init(view: DetailStocksViewType,
         interactor: DetailStocksInteractorType,
         router: DetailStocksRouterType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Protocol methods
    func viewDidLoad() {
        
    }
    
    func didTapButton() {
        print("DSADSA")
    }
}
