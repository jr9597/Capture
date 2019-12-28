//
//  roundImage.swift
//  Capture
//
//  Created by Jerrod Kim on 12/12/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//
//  Jerrod Kim
//  jiryangk@usc.edu

import UIKit

extension UIImageView {
    
    //for the profile pic rounding
    func makeRounded() {

        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = false
        //self.layer.borderColor =
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
