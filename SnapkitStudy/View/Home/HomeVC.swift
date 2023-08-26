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
    
    lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let count: CGFloat = 1
        let width: CGFloat = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10         // 셀과셀 위 아래 최소 간격
//        layout.minimumInteritemSpacing = 10    // 셀과셀 좌 우 최소 간격
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    var list = ["1","2","3","4","5","6","7","8","9","10"]
    
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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        self.navigationItem.title = "와우"
        self.navigationItem.titleView = searchBar
        
        navigationItem.rightBarButtonItems = [navAlarmBarButton, navMessageBarButton]
    }
    
    override func setConstraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(row: list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = list[indexPath.row]
        print(row)
    }
    
}
