//
//  Exstensions.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 25.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
