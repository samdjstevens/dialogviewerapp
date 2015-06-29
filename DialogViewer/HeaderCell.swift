//
//  HeaderCell.swift
//  DialogViewer
//
//  Created by Sam Stevens on 29/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import UIKit

class HeaderCell: ContentCell {
    
    // Initialiser to define the labels config
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Override some of the label configuration
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.8, alpha: 1.0)
        label.textColor = UIColor.blackColor()
    }
    
    // Required init
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Set the font for the header cell to be the preferred headline font
    override class func defaultFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    }
}
