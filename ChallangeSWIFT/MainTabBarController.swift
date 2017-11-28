//
//  MainTabBarController.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 22.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .white
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        //search
        let layout = UICollectionViewFlowLayout()
        let listViewController = UserListViewController(collectionViewLayout: layout)
        let navListViewController = UINavigationController(rootViewController: listViewController)
        
        navListViewController.tabBarItem.image = #imageLiteral(resourceName: "search_unselected")
        navListViewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_selected")
        
        //webView
        let webViewViewController = WebViewViewController()
        let navProfileDetailViewController = UINavigationController(rootViewController: webViewViewController)
        
        navProfileDetailViewController.tabBarItem.image = #imageLiteral(resourceName: "grid-world")
        navProfileDetailViewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "grid-world")
        
        tabBar.tintColor = UIColor(red: 255/255, green: 8/255, blue: 0/255, alpha: 1)
        
        viewControllers = [navListViewController, navProfileDetailViewController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}



