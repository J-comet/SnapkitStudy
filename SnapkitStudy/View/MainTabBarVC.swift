//
//  ViewController.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/26.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
//    var defaultIdx = 0 {
//        didSet {
//          self.selectedIndex = defaultIdx
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        selectedIndex = 0
        
        let homeNav = UINavigationController()
        let home = HomeVC()
        homeNav.addChild(home)
        homeNav.tabBarItem.image = UIImage(systemName: "house")
        homeNav.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        homeNav.tabBarItem.title = "홈"
        
        let searchNav = UINavigationController()
        let search = SearchVC()
        searchNav.addChild(search)
        searchNav.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        searchNav.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        searchNav.tabBarItem.title = "검색"
        
        let profileNav = UINavigationController()
        let profile = ProfileVC()
        profileNav.addChild(profile)
        profileNav.tabBarItem.image = UIImage(systemName: "person")
        profileNav.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        profileNav.tabBarItem.title = "프로필"
        
        let viewControllers = [homeNav, searchNav, profileNav]
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.clear
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.link
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.isHidden = false
    }
    
    
}

