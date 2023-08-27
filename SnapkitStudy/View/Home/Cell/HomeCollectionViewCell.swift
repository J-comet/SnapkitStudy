//
//  HomeCollectionViewCell.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit

import SnapKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell, BaseCellProtocol {
    
    typealias T = Document
    
    let containerView = {
        let view = UIView()
        return view
    }()
    
    let thumbImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 15)
        view.numberOfLines = 2
        view.textColor = .black
        return view
    }()
    
    let contentLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12, weight: .medium)
        view.textColor = .lightGray
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(row: Document) {
        thumbImageView.layoutIfNeeded()
        thumbImageView.layer.cornerRadius = thumbImageView.frame.width / 10
        
        titleLabel.text = row.title
        contentLabel.text = row.content
        guard let imgPath = URL(string: row.thumbnail) else { return }
        thumbImageView.kf.setImage(with: imgPath)
    }
    
    func setConstraints() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(thumbImageView)
        thumbImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalToSuperview()
        }
        
        titleLabel.backgroundColor = .blue
        containerView.addSubview(titleLabel)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(thumbImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            
        }
        
        contentLabel.backgroundColor = .orange
        containerView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(thumbImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
    }
    
    
}
