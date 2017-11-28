//
//  ProfileDetailCell.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 24.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

class ProfileDetailCell: UICollectionViewCell {
    
    var detail:InfoDetail? {
        didSet {
            
            guard let unwrapedDetail = detail else { return }
            
            iconImageView.image = unwrapedDetail.icon
            cellLabel.text = unwrapedDetail.info
        }
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "profile_selected")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.text = "Detail info"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        addSubview(iconImageView)
        addSubview(cellLabel)
        
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 30).isActive = true
        cellLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -6).isActive = true
        cellLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    
    }
}

