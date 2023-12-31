//
//  ConfigurableView.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import UIKit

protocol ConfigurableView { }
extension ConfigurableView {
    @discardableResult
    func setup(_ block: (_ view: Self) -> Void) -> Self {
        block(self)
        return self
    }
}
extension UIView: ConfigurableView { }
