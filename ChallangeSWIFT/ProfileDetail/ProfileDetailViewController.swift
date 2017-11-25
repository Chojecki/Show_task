//
//  ProfileDetailViewController.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 22.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    var user: User? {
        didSet {
            profileTitle =  user?.name["first"]!
            
        }
    }
    
    var profileTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = profileTitle
    }
}
