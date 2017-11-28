//
//  DataManager.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 23.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import Foundation

final class DataManager {
    
    typealias APIDataCompletion = ([User]) -> ()
    
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func fetchUsers(seed: Int, page: Int, completion: @escaping APIDataCompletion) {
        
       let jsonUrlString = "\(baseURL)?seed=\(seed)&page=\(page)&results=20"
        let queryURL = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: queryURL!) { (data, respoinse, err) in
            guard let data = data else { return }
            
            do {
                let fetechedUsers = try JSONDecoder().decode(Results.self, from: data)
                completion(fetechedUsers.results)

            } catch let jsonErr {
                print("Error:", jsonErr)
            }
        }.resume()
    }
}
