//
//  User.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 21.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let results: [User]
}

struct Location: Decodable {
    let city: String
}

struct User: Decodable {
    let name: [String: String]
    let picture: [String: String]
    let cell: String
    let email: String
    let location: Location
    let gender: String
}

