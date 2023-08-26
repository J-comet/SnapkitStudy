//
//  BaseViewController.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
        setConstraints()
        configNavigationBar()
    }
    
    @objc func configNavigationBar() {}
    func configVC() {}
    func setConstraints() {}
}
