//
//  SearchVC.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    let label01 = {
        let view = UILabel()
        view.text = "적당한 텍스트"
        view.backgroundColor = .blue
        return view
    }()

    let label02 = {
        let view = UILabel()
        view.text = "짧은텍스트"
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label01)
        label01.contentHuggingPriority(for: .vertical)
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
