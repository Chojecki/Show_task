//
//  ShadowView.swift
//  ChallangeSWIFT
//
//  Created by Marek Chojecki on 24.11.2017.
//  Copyright © 2017 Marek Chojecki. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 6.0
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
