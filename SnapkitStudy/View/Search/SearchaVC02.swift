//
//  SearchVC02.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import UIKit

class SearchaVC02: UIViewController {

    lazy var label01 = ClickableLabel().setup { view in
        view.text = "많이 길고 긴 텍스트"
        view.textColor = .white
        view.backgroundColor = .blue
    }
    
    lazy var label02 = ClickableLabel().setup { view in
        view.text = "짧은 텍스트"
        view.textColor = .white
        view.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label01)
        
        label01.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        view.addSubview(label02)
        label02.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(label01.snp.trailing)
            make.trailing.equalToSuperview()
        }
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SearchaVC02_PreViews: PreviewProvider {
    static var previews: some View {
        SearchaVC02().showPreview(.iPhone12Pro)
    }
}
#endif
