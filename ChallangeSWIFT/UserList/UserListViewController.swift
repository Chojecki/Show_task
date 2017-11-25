//
//  UserList.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 21.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellId"
private let refreshControl = UIRefreshControl()

class UserListViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating {
    
    var users = [User]()
    var filteredUsers = [User]()
    var apiUrlPage = 1
    var apiUrlSeed = 1
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profiles"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 8/255, blue: 0/255, alpha: 1)
        
        let attributes = [
            NSAttributedStringKey.foregroundColor : UIColor.black
        ]
        
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Profiles"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        collectionView?.backgroundColor = .white
        collectionView?.register(UserListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.alwaysBounceVertical = true
        collectionView?.refreshControl = refreshControl
        collectionView?.contentInsetAdjustmentBehavior = .always
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove first cell", style: .plain, target: self, action: #selector(handleRemoveFirstCell(_:)))
        
        refreshControl.addTarget(self, action: #selector(refreshProfiles(_:)), for: .valueChanged)
        
        fetchAPI()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc private func handleRemoveFirstCell(_ sender: Any) {
        users.remove(at: 0)
        collectionView?.reloadData()
    }
    
    @objc private func refreshProfiles(_ sender: Any) {
        fetchAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    func fetchAPI() {
        let jsonUrlString = "https://randomuser.me/api/?seed=\(apiUrlSeed)&page=\(apiUrlPage)&results=20"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respoinse, err) in
            guard let data = data else { return }
            
            do {
                let randomUsers = try JSONDecoder().decode(Results.self, from: data)
                
                self.users.append(contentsOf: randomUsers.results)
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                
            } catch let jsonErr {
                print("Error:", jsonErr)
            }
        }.resume()
        
        refreshControl.endRefreshing()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    //TODO: unwrap name
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredUsers = users.filter({(user : User) -> Bool in
            return (user.name["first"]!.lowercased().contains(searchText.lowercased()))
        })
        
        collectionView?.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering() {
            return filteredUsers.count
        }
        
        return users.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! UserListCell
        
        if indexPath.item == users.count - 1 {
            self.apiUrlSeed += 1
            self.apiUrlPage += 1
            
            fetchAPI()
        }
        
        if isFiltering() {
            let filteredUser = self.filteredUsers[indexPath.item]
            cell.user = filteredUser
        } else {
            let user = self.users[indexPath.item]
            cell.user = user
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tappedUser = users[indexPath.item]
        let profileDetailViewController = ProfileDetailViewController()
        profileDetailViewController.user = tappedUser
        
        navigationController?.pushViewController(profileDetailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }
}
