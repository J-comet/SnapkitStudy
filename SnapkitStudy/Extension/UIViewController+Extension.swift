//
//  UIViewController+Extension.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import SwiftUI
import UIKit

enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    
    var name: String {
        switch self {
        case .iPhone12Pro: return "iPhone SE"
        case .iPhone12ProMax: return "iPhone 8"
        case .iPhone8: return "iPhone 12 Pro"
        case .iPhoneSE2: return "iPhone 12 Pro Max"
        }
    }

//    func name() -> String {
//        switch self {
//        case .iPhoneSE2:
//            return "iPhone SE"
//        case .iPhone8:
//            return "iPhone 8"
//        case .iPhone12Pro:
//            return "iPhone 12 Pro"
//        case .iPhone12ProMax:
//            return "iPhone 12 Pro Max"
//        }
//    }
}

#if canImport(SwiftUI) && DEBUG
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone8) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name))
    }
}
#endif
