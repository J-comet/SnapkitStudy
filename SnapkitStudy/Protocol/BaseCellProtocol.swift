//
//  BaseCellProtocol.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import Foundation

protocol BaseCellProtocol {
    associatedtype T
    func setConstraints()
    func configureCell(row: T)
}
