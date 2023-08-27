//
//  SearchVC02.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import UIKit
import SnapKit

class SearchaVC02: BaseViewController {
    
    lazy var label01 = ClickableLabel().setup {
        $0.text = "많이 길고 긴 텍스트"
        $0.textColor = .white
        $0.backgroundColor = .blue
    }
    
    lazy var label02 = ClickableLabel().setup {
        $0.text = "짧은 텍스트"
        $0.textColor = .white
        $0.backgroundColor = .red
    }
    
    lazy var topStackView = UIStackView().setup {
        $0.distribution = .fillEqually
    }

    lazy var button001 = UIButton().setup {
        $0.setTitle("111", for: .normal)
        $0.backgroundColor = .magenta
    }
    
    // 아래 코드는 수동으로 연결하는 코드
    
    lazy var mainStackView = UIStackView().setup {
        $0.distribution = .fillEqually
    }
    
    lazy var connectBtn = UIButton().setup {
        $0.setTitle("333", for: .normal)
        $0.backgroundColor = .blue
    }
    
    lazy var writeBtn = UIButton().setup {
        $0.setTitle("333", for: .normal)
        $0.backgroundColor = .green
    }
    
    lazy var disconnectBtn = UIButton().setup {
        $0.setTitle("333", for: .normal)
        $0.backgroundColor = .red
    }
    
    lazy var tableView = UITableView().setup {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        $0.backgroundColor = .brown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label01)
        label01.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(50)
        }

        view.addSubview(label02)
        label02.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(label01.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        remakeTest()
        

    }
    
    func remakeTest() {
        // remake
        label01.onClick = {
            self.label01.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview()
                make.height.equalTo(100)
            }
            UIView.animate(withDuration: 1.0) {
                self.label01.layoutIfNeeded()
            }
        }
        
        // remake
        label02.onClick = {
            self.label02.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(self.label01.snp.trailing)
                make.trailing.equalToSuperview()
                make.height.equalTo(100)
            }
            UIView.animate(withDuration: 10.0) {
                self.label02.layoutIfNeeded()
            }
        }
    }
    
    override func setConstraints() {
        
        view.addSubview(mainStackView)
        view.addSubview(tableView)
        view.addSubview(topStackView)
        
        mainStackView.addArrangedSubview(connectBtn)
        mainStackView.addArrangedSubview(writeBtn)
        mainStackView.addArrangedSubview(disconnectBtn)
       
        topStackView.addArrangedSubview(button001)
        
        
        mainStackView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.centerY).dividedBy(4)
        }
        

        topStackView.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.snp.centerY)
            $0.left.bottom.right.equalToSuperview()
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
