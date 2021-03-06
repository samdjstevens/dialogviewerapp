//
//  ViewController.swift
//  DialogViewer
//
//  Created by Sam Stevens on 29/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    private var sections: [[String: String]]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Define the sections
        sections = [
        
            [
                "header": "First Witch",
                "content": "Hey, when will the three of us meet up later?"
            ],
            [
                "header": "Second Witch",
                "content": "When everything's straightened out."
            ],
            [
                "header": "Third Witch",
                "content": "That'll be just before sunset."
            ],
            [
                "header": "First Witch",
                "content": "Where?"
            ],
            [
                "header": "Second Witch",
                "content": "The dirst patch."
            ],
            [
                "header": "Third Witch",
                "content": "I guess we'll see Mac there."
            ]
        ]
    
        
        // Register the ContentCell class with the collection view
        collectionView?.registerClass(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
        
        // Registe the HeaderCell class with the collection view
        collectionView?.registerClass(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HEADER")
        
        // Move the content view down from the status bar
        var contentInset = collectionView?.contentInset
        contentInset?.top = 20
        collectionView?.contentInset = contentInset!
        
        // Grab the collection view layout
        let layout = collectionView?.collectionViewLayout
        let flow = layout as! UICollectionViewFlowLayout
        
        // Set the section inset to give some padding
        flow.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        
        // Set the header reference size
        flow.headerReferenceSize = CGSizeMake(100, 25)
    }
    
    // Helper method to retrieve an array(?) of words in a string.
    func  wordsInSection(section: Int) -> [String] {
        let content = sections[section]["content"]
        let spaces = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let words = content?.componentsSeparatedByCharactersInSet(spaces)
        
        return words!
    }
    
    // The number of sections to display
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    // The number of cells in a section
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return wordsInSection(section).count
    }
    
    // The content of a cell
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // The words for this section
        let words = wordsInSection(indexPath.section)
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CONTENT", forIndexPath: indexPath) as! ContentCell
        cell.maxWidth = collectionView.bounds.size.width
        cell.text = words[indexPath.row]
        
        return cell
        
    }
    
    // view for the header cells
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HEADER", forIndexPath: indexPath) as! HeaderCell
            cell.maxWidth = collectionView.bounds.size.width
            cell.text = sections[indexPath.section]["header"]
            return cell
        }
        abort()
    }
    
    // Determine the size of a cell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let words = wordsInSection(indexPath.section)
        let size = ContentCell.sizeForContentString(words[indexPath.row], forMaxWidth: collectionView.bounds.size.width)
        
        return size
    }
}

