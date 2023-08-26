//
//  HomeVC.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit
import SnapKit

class HomeVC: BaseViewController {
    
    let searchBar = {
        let view = UISearchBar()
        view.searchTextField.leftView?.tintColor = .blue
        view.searchTextField.textColor = .red
        view.searchTextField.attributedPlaceholder = NSAttributedString(string: "검색어 입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return view
    }()
    
    lazy var navMessageBarButton = {
        let view = UIBarButtonItem(
            image: UIImage(systemName: "paperplane.fill"),
            style: .plain,
            target: self,
            action: #selector(naviBarButtonClicked(_:))
        )
        view.tintColor = .green
        return view
    }()
    
    lazy var navAlarmBarButton = {
        let view = UIBarButtonItem(
            image: UIImage(systemName: "bell.fill"),
            style: .plain,
            target: self,
            action: #selector(naviBarButtonClicked(_:))
        )
        view.tintColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc
    func naviBarButtonClicked(_ sender: UIBarButtonItem) {
        switch sender {
        case navMessageBarButton:
            print("메시지 버튼")
        case navAlarmBarButton:
            print("알림 버튼")
        default:
            print("default")
        }
    }
    
    override func configVC() {
        
    }
    
    override func configNavigationBar() {
        self.navigationItem.title = "와우"
        self.navigationItem.titleView = searchBar
        
        navigationItem.rightBarButtonItems = [navAlarmBarButton, navMessageBarButton]
    }
    
    override func setConstraints() {
        
    }
}
