//
//  BaseButton.swift
//  SnapkitTest2
//
//  Created by Bohdan on 03.05.2023.
//

import UIKit

open class BaseButton: UIButton {
    public convenience init() {
        self.init(frame: .zero)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    open func setup() {
    }
}
