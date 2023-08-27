//
//  HomeVC.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit
import SnapKit
import SafariServices

class HomeVC: BaseViewController {
    
    lazy var searchBar = {
        let view = UISearchBar()
        view.delegate = self
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
//        let spacing: CGFloat = 8
        let count: CGFloat = 1
        let width: CGFloat = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 8         // 셀과셀 위 아래 최소 간격
//        layout.minimumInteritemSpacing = 10    // 셀과셀 좌 우 최소 간격
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.prefetchDataSource = self
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    let emptyLabel = {
        let view = ClickableLabel()
        view.text = "검색어를 입력해주세요"
        view.textColor = .gray
        view.font = .systemFont(ofSize: 15)
        view.textAlignment = .center
        view.backgroundColor = .white
        return view
    }()
    
    var videoList: [Document] = [] {
        didSet {
            emptyLabel.isHidden = videoList.isEmpty ? false : true
            collectionView.reloadData()
        }
    }
    
    lazy var viewTabGesture = {
        return UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
    }()
    
    var page = 1
    var isEnd = false  // 페이징 체크
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func callRequest(page: Int, query: String) {
        KakaoAPIManager.shared.call(
            type: .video,
            parameterDic: [
                "query" : query,
                "page" : String(page)
            ],
            responseData: KakaoVideo.self) { response in
                self.videoList.append(contentsOf: response.documents)
                self.isEnd = response.meta.isEnd
            } failHandler: { error in
                print(error)
            }
    }
    
    @objc
    func tapHandler(_ sender: UITapGestureRecognizer) {
        switch sender {
        case viewTabGesture:
            print("탭 제스쳐")
            searchBar.endEditing(true)
        default:
            print("default")
        }
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
        emptyLabel.onClick = {
            print("click")
            self.searchBar.endEditing(true)
        }
    }
    
    override func configNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
//        appearance.backgroundEffect = UIBlurEffect()
        appearance.backgroundColor = .cyan
        
        UINavigationBar.appearance().isTranslucent = false
        
//        navigationController?.navigationBar.compactAppearance = appearance
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
        
        view.addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        videoList.removeAll()
        page = 1
        callRequest(page: page, query: searchBar.text!)
        searchBar.endEditing(true)
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if videoList.count - 1 == indexPath.row && page < 15 && !isEnd {
                page += 1
                callRequest(page: page, query: searchBar.text!)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(row: videoList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = videoList[indexPath.row]
        let youtubeUrl = URL(string: row.url)
        guard let youtubeUrl else { return }
        let safariView: SFSafariViewController = SFSafariViewController(url: youtubeUrl)
        self.present(safariView, animated: true, completion: nil)
    }
    
}
