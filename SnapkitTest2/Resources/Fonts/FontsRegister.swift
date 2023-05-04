//
//  FontsRegister.swift
//  SnapkitTest2
//
//  Created by Bohdan on 04.05.2023.
//

import UIKit

public class FontsRegister {
    public static let register: Void = {
        registerFont("beer-money12")
        registerFont("Inter-Bold")
    }()
    private class func registerFont(_ fontName: String) {
        let fontURL = Bundle.main.url(forResource: fontName, withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        
//        let fontData = NSData(contentsOfFile: pathForResourceString!)
//        let dataProvider = CGDataProvider(data: fontData!)
//        let fontRef = CGFont(dataProvider!)
//        var errorRef: Unmanaged<CFError>?
//        if (!CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef)) {
//            print("Failed to register font")
//        }
    }
}

public protocol TextStyleProtocol {
    var fontFamily: String { get }
    var weight: String { get }
    var lineHeight: CGFloat? { get }
    var size: CGFloat { get }
    var kern: CGFloat? { get }
}
public class TextAttributesFactory {
    public static func textAttributes(forTextStyle textStyle: TextStyleProtocol,
                                      color: UIColor,
                                      textAlignment: NSTextAlignment? = nil,
                                      lineBreakMode: NSLineBreakMode? = .byTruncatingTail,
                                      ignoreLineHeight: Bool = false) -> [NSAttributedString.Key: Any] {
        let font = UIFont(textStyle)
        let paragraphStyle = NSMutableParagraphStyle()
        lineBreakMode.flatMap { paragraphStyle.lineBreakMode = $0 }
        textAlignment.flatMap { paragraphStyle.alignment = $0 }
        if !ignoreLineHeight {
            textStyle.lineHeight.flatMap { paragraphStyle.lineSpacing = $0 - font.lineHeight }
        }
        var attributes: [NSAttributedString.Key: Any] = [.font: font,
                                                         .paragraphStyle: paragraphStyle,
                                                         .foregroundColor: color]
        attributes[.kern] = textStyle.kern
        return attributes
    }
}
public extension UIFont {
    convenience init(_ textStyle: TextStyleProtocol) {
        self.init(name: "\(textStyle.fontFamily)-\(textStyle.weight)", size: textStyle.size)!
    }
}

public enum TextStyle: TextStyleProtocol {
    case header0Medium
    case second
    
    public var fontFamily: String {
        switch self {
        case .header0Medium:
            return "beer"
        case .second:
            return "Inter"
        }
    }
    public var weight: String {
        switch self {
        case .header0Medium:
            return "money12"
        case .second:
            return "Bold"
        }
    }
    public var lineHeight: CGFloat? {
        switch self {
        case .header0Medium, .second:
            return nil
        }
    }
    public var size: CGFloat {
        switch self {
        case .header0Medium, .second:
            return 14
        }
    }
    public var kern: CGFloat? {
        switch self {
        case .header0Medium, .second:
            return nil
        }
    }
}
public extension TextStyle {
    static var `default`: TextStyle {
        Self.second
    }
}
