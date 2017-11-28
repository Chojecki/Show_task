//
//  WebViewViewController.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 25.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    let websiteWebView: UIWebView = {
        let wv = UIWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(websiteWebView)
        websiteWebView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        websiteWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        websiteWebView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        websiteWebView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let websiteURL = URL(string: "https://piano-dog.firebaseapp.com")
        let request = URLRequest(url: websiteURL!)
        
        websiteWebView.loadRequest(request)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
