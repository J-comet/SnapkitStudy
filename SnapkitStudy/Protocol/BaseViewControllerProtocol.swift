//
//  BaseViewControllerProtocol.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit

@objc
protocol BaseViewControllerProtocol {
    @objc optional func configNavigationBar()
    func configVC()
    func setConstraints()
}
