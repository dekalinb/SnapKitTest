//  
//  DetailStocksRouter.swift
//  SnapkitTest2
//
//  Created by Bohdan on 02.05.2023.
//

import UIKit

protocol DetailStocksRouterType {
    
}

class DetailStocksRouter: DetailStocksRouterType {
    
    private weak var viewController: DetailStocksViewController?
    
    // MARK: - Protocol property
    
    init(viewController: DetailStocksViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Protocol methods
}
