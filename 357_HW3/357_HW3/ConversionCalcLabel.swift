//
//  ConversionCalcLabel.swift
//  357_HW3
//
//  Created by Hai Duong on 9/30/18.
//  Copyright © 2018 Hai Duong. All rights reserved.
//

import UIKit

class ConversionCalcLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        self.textColor = FOREGROUND_COLOR
    }

}
