//
//  Extension + Bundle.swift
//  SnapkitTest2
//
//  Created by Bohdan on 04.05.2023.
//

import Foundation

private class BundleFinder {}
extension Bundle {
    static var current: Bundle {
        Bundle(for: BundleFinder.self)
    }
}
