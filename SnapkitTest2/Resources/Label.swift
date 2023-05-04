//
//  Label.swift
//  SnapkitTest2
//
//  Created by Bohdan on 04.05.2023.
//

import UIKit
import SwiftUI

public class Label: UILabel {
    // MARK: - Public Properties
    public var textStyle: TextStyle = .default {
        didSet {
            updateTextStyle()
        }
    }
    //  public var textColorStyle: ColorStyle = .defaultTextColorStyle {
    //    didSet {
    //      textColor = UIColor(textColorStyle)
    //      updateTextStyle()
    //    }
    //  }
    public override var textAlignment: NSTextAlignment {
        didSet {
            updateTextStyle()
        }
    }
    //  public var localizedText: LocalizedString? {
    //    didSet {
    //      text = localizedText?.localized
    //    }
    //  }
    public override var text: String? {
        didSet {
            updateTextStyle()
        }
    }
    public override var textColor: UIColor? {
        didSet {
            updateTextStyle()
        }
    }
    public override var lineBreakMode: NSLineBreakMode {
        didSet {
            updateTextStyle()
        }
    }
    // MARK: - Public
    //  public func setLocalizedText(_ localizedText: LocalizedString?) {
    //    text = localizedText?.localized
    //  }
}
// MARK: - Private
private extension Label {
    func updateTextStyle() {
        guard let text = text else { return }
        let attributes = TextAttributesFactory.textAttributes(forTextStyle: textStyle,
                                                              color: textColor ?? .black,
                                                              textAlignment: textAlignment,
                                                              lineBreakMode: lineBreakMode)
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }
}
#if targetEnvironment(simulator)
import SwiftUI
@available (iOS 13.0, *)
struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Preview {
                let label = Label()
                label.textStyle = .second
                label.textColor = .blue
                label.text = "Hello world"
                return label
            }
        }
    }
}
#endif
