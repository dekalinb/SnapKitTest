//
//  Extension + UIView.swift
//  SnapkitTest2
//
//  Created by Bohdan on 03.05.2023.
//

import UIKit

extension UIView {
    @discardableResult
    func addSubview<ViewType: UIView>(_ subview: ViewType,
                                      configure: (ViewType) -> Void = { _ in }) -> ViewType {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        configure(subview)
        return subview
    }
}
