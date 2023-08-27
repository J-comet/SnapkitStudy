//
//  UIView+Extension.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }
    
    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: deviceType.name))
    }
}
#endif
