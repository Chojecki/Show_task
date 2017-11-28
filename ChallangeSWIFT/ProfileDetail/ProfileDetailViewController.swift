//
//  ProfileDetailViewController.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 22.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellId_detail"
private let reuseIdentifierHeader = "CellId_detail_header"

class ProfileDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var details: [InfoDetail] = [ InfoDetail(info: "No data", icon: #imageLiteral(resourceName: "phone-call")) ]
    var user: User? {
        didSet {
            guard let unwrapedUser = user else { return }
            
            details = [
                InfoDetail(info: unwrapedUser.cell, icon: #imageLiteral(resourceName: "phone-call")),
                InfoDetail(info: unwrapedUser.email, icon: #imageLiteral(resourceName: "envelope")),
                InfoDetail(info: unwrapedUser.gender, icon: #imageLiteral(resourceName: "profile_selected")),
                InfoDetail(info: unwrapedUser.location.city.capitalizingFirstLetter(), icon: #imageLiteral(resourceName: "skyline"))
            ]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ProfileDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(ProfileDetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInsetAdjustmentBehavior = .always
        
        navigationItem.title = "Profile Detail"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileDetailCell
        
        let info = details[indexPath.item]
        cell.detail = info
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierHeader, for: indexPath) as! ProfileDetailHeaderCell
        
        header.user = user
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
