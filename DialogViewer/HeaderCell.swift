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
    
    // Override the parent class to get the size of the cell given the string
    // to have full width headers
    override class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {

        // Get the actual bounding box size
        let size = super.sizeForContentString(s, forMaxWidth: maxWidth)
        
        // But then return that height, but full (max) width
        return CGRectMake(0, 0, maxWidth, size.height).size

    }
}
