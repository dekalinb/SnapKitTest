//
//  CustomButton.swift
//  SnapkitTest2
//
//  Created by Bohdan on 03.05.2023.
//

import UIKit
import Foundation

open class Button: BaseButton {
    // MARK: - Definitions
    public enum Constants {
        static let defaultHeight: CGFloat = 44
    }
    public enum ImagePosition {
        case left
        case right
    }
    public enum ButtonStyle {
        case primary
        case secondary
    }
    // MARK: - Public Properties
    public var onButtonTap: (() -> ())? {
        didSet {
            addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    public var imagePosition: ImagePosition = .left {
        didSet {
            updateImagePosition()
        }
    }
    // https://developer.apple.com/forums/thread/125492?page=2
    // Elegant workaround. When device has bold text turned on in accessibility settings. UIButton reports wrong intrinsic content size for image view
    // and for that reason the text is clipped
    public override var intrinsicContentSize: CGSize {
        let intrinsicContentSize = super.intrinsicContentSize
        guard let imageView = imageView else {
            return intrinsicContentSize
        }
        let imageSizeThatFits = imageView.sizeThatFits(CGSize(width: .max, height: .max))
        let imageIntrinsicContentSize = imageView.intrinsicContentSize
        let imageSizeDifference = CGSize(width: imageSizeThatFits.width - imageIntrinsicContentSize.width,
                                         height: imageSizeThatFits.height - imageIntrinsicContentSize.height)
        return CGSize(width: intrinsicContentSize.width + imageSizeDifference.width,
                      height: intrinsicContentSize.height + imageSizeDifference.height)
    }
    // MARK: - Private Properties
    private var style: ButtonStyle?
    // MARK: - Init
    public convenience init(style: ButtonStyle) {
        self.init(type: .system)
        self.style = style
//        setup(with: style)
    }
    // MARK: - Setup
    override open func setup() {
        super.setup()
        updateImagePosition()
    }
    
    // MARK: - Public
//    public override func setTitle(_ title: String?, for state: UIControl.State) {
//        super.setTitle(title, for: state)
//        style.flatMap {
//            guard let title = title else { return }
////            let attributes = titleAttributes(for: $0)
//            let attributedTitle = NSAttributedString(string: title, attributes: ) //attributes)
//            setAttributedTitle(attributedTitle, for: state)
//        }
//    }
    public func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
    // MARK: - Action
    @objc
    private func didTapButton() {
        onButtonTap?()
    }
}
// MARK: - Common
private extension Button {
    func updateImagePosition() {
        // https://stackoverflow.com/questions/7100976/how-do-i-put-the-image-on-the-right-side-of-the-text-in-a-uibutton
        var scaleTransform = CGAffineTransform.identity
        if imagePosition == .right {
            scaleTransform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }
        transform = scaleTransform
        titleLabel?.transform = scaleTransform
        imageView?.transform = scaleTransform
    }
}
// MARK: - Styled Button
//private extension Button {
//    func setup(with style: ButtonStyle) {
//        snp.makeConstraints { make in
//            make.height.equalTo(Constants.defaultHeight)
//        }
//        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//        cornerRadius = 4
//        borderWidth = 1
//        backgroundColor = backgroundColor(for: style)
//        borderColor = borderColor(for: style)
//    }
//    func backgroundColor(for style: ButtonStyle) -> UIColor {
//        switch style {
//        case .primary:
//            return UIColor(.mainPrimary)
//        case .secondary:
//            return UIColor(.mainAccent).withAlphaComponent(0.05)
//        }
//    }
//    func borderColor(for style: ButtonStyle) -> UIColor {
//        switch style {
//        case .primary:
//            return UIColor(.mainAccent).withAlphaComponent(0.2)
//        case .secondary:
//            return UIColor(.mainAccent).withAlphaComponent(0.15)
//        }
//    }
//    func titleAttributes(for style: ButtonStyle) -> [NSAttributedString.Key: Any] {
//        TextAttributesFactory.textAttributes(forTextStyle: .body2Semibold,
//                                             colorStyle: .defaultTextColorStyle)
//    }
//}
