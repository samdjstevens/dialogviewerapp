//
//  ContentCell.swift
//  DialogViewer
//
//  Created by Sam Stevens on 29/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    
    // The label of the cell
    var label: UILabel!
    
    // The text that is written in the label
    var text: String! {
        
        // Retrieve the text from the label
        get {
            return label.text
        }
        
        set(newText) {
            // Change the label text
            label.text = newText
            
            // Create new frames from the existing label and content frames
            var newLabelFrame = label.frame
            var newContentFrame = contentView.frame
            
            // Calculate the new size
            let textSize = self.dynamicType.sizeForContentString(newText, forMaxWidth: maxWidth)
            
            // Set the sizes of the new frames
            newLabelFrame.size = textSize
            newContentFrame.size = textSize
            
            // Set the label and content view frames to be the new frames
            label.frame = newLabelFrame
            contentView.frame = newContentFrame
        }
    }
    
    // The max width of the cell
    var maxWidth: CGFloat!
    
    // Type method to determine how big the cell needs to be, given the string it will display.
    class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {
        
        // Max size of the max width and 1000 height
        let maxSize = CGSizeMake(maxWidth, 1000)
        
        // String drawing options
        let opts = NSStringDrawingOptions.UsesLineFragmentOrigin
        
        // Paragraph style that allows word wrapping
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = NSLineBreakMode.ByCharWrapping
        
        // Attributes of the string - the font and paragraph style
        let attributes = [
            NSFontAttributeName: self.defaultFont(),
            NSParagraphStyleAttributeName: style
        ]
        
        // Calculate the size of the string
        let string = s as NSString
        let rect = string.boundingRectWithSize(maxSize, options: opts, attributes: attributes, context: nil)
        
        return rect.size
    }
    
    // Type method to determine the font for the label
    class func defaultFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
    
    // Initialiser
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create and configure the label
        label = UILabel(frame: self.contentView.bounds)
        label.opaque = false
        label.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.font = self.dynamicType.defaultFont()
        
        // Add the label to the content view
        contentView.addSubview(label)
    }
    
    // Required initialiser
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
