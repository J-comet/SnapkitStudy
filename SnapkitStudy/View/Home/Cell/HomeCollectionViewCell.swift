//
//  HomeCollectionViewCell.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell, BaseCellProtocol {
    
    typealias T = String
    
    let thumbImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(row: String) {
        
    }
    
    func setConstraints() {
        thumbImageView.backgroundColor = .cyan
        contentView.addSubview(thumbImageView)
        thumbImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    
}
