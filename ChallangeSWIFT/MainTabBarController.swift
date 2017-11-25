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
        
        //profile
        let profileDetailViewController = ProfileDetailViewController()
        let navProfileDetailViewController = UINavigationController(rootViewController: profileDetailViewController)
        
        navProfileDetailViewController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navProfileDetailViewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        tabBar.tintColor = UIColor(red: 255/255, green: 8/255, blue: 0/255, alpha: 1)
        
        viewControllers = [navListViewController, navProfileDetailViewController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}



