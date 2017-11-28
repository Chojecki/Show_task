//
//  ProfileDetailHeaderCell.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 24.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

class ProfileDetailHeaderCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            
            guard let unwrapedUser = user else { return }
            guard let unwrapedUserName = unwrapedUser.name["first"] else { return }
            guard let unwrapedLastUserName = unwrapedUser.name["last"] else { return }
            guard let unwrapedImageUrl = unwrapedUser.picture["large"] else { return }
            
            avatarImage.loadImage(urlString: unwrapedImageUrl)
            userNameLabel.text = unwrapedUserName.capitalizingFirstLetter()
            userLastNameLabel.text = unwrapedLastUserName.capitalizingFirstLetter()
        }
    }
    
    let headerView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "ios_bg")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Marek"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 54)
        label.textColor = .white
        return label
    }()
    
    let userLastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chojecki"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 54)
        label.textColor = .white
        return label
    }()
    
    let avatarView: ShadowView = {
        let view = ShadowView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 60
        view.backgroundColor = .white
        return view
    }()
    
    let avatarImage: CustomImageView = {
        let view = CustomImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    private func setupCell() {
        
        addSubview(headerView)
        addSubview(avatarView)
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        headerView.addSubview(userNameLabel)
        headerView.addSubview(userLastNameLabel)
        userNameLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20).isActive = true
        userNameLabel.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -6).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 6).isActive = true
        
        userLastNameLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 6).isActive = true
        userLastNameLabel.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -6).isActive = true
        userLastNameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 6).isActive = true
        
        avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        avatarView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -90).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        avatarView.addSubview(avatarImage)
        avatarImage.topAnchor.constraint(equalTo: avatarView.topAnchor).isActive = true
        avatarImage.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor).isActive = true
        avatarImage.leftAnchor.constraint(equalTo: avatarView.leftAnchor).isActive = true
        avatarImage.rightAnchor.constraint(equalTo: avatarView.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
