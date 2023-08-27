//
//  ProfileVC.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ProfileVC_PreViews: PreviewProvider {
    static var previews: some View {
        ProfileVC().showPreview(.iPhone12Pro)
    }
}
#endif
