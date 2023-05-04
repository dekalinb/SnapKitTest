//
//  Preview.swift
//  SnapkitTest2
//
//  Created by Bohdan on 03.05.2023.
//

import SwiftUI

@available(iOS 13.0, *)
public struct Preview: View {
    
    private let factory: () -> UIView
    private let externalConfiguration: () -> ()
    
    public init(factory: @escaping () -> UIView, externalConfiguration: @escaping () -> ()) {
        self.factory = factory
        self.externalConfiguration = externalConfiguration
    }
    
    public var body: some View {
        Renderer(factory, externalConfiguration: externalConfiguration)
    }
    
    private struct Renderer: UIViewRepresentable {
        private let factory: () -> UIView
        init(_ factory: @escaping () -> UIView, externalConfiguration: () -> ()) {
            externalConfiguration()
            self.factory = factory
        }
        func makeUIView(context: Context) -> UIView {
            factory()
        }
        func updateUIView(_ uiView: UIView, context: Context) {
            // empty
        }
    }
}

public extension Preview {
    init(factory: @escaping () -> UIView) {
        self.init(factory: factory) {
//            FontsRegister.register
        }
    }
}
