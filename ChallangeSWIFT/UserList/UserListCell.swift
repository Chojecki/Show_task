//
//  UserListCell.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 21.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

class UserListCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            
            guard let unwrapedUser = user else { return }
            guard let unwrapedUserName = unwrapedUser.name["first"] else { return }
            guard let unwrapedImageUrl = unwrapedUser.picture["thumbnail"] else { return }
            
            userNameTextView.text = unwrapedUserName
            userProfileImageView.loadImage(urlString: unwrapedImageUrl)
            
        }
    }
    
    let userProfileImageView: CustomImageView = {
        let iv = CustomImageView(image: #imageLiteral(resourceName: "woman"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let userNameTextView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 8/255, blue: 0/255, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(userProfileImageView)
        userProfileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userProfileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        userProfileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userProfileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(userNameTextView)
        userNameTextView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userNameTextView.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 20).isActive = true
        userNameTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(separator)
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separator.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 20).isActive = true
        separator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
