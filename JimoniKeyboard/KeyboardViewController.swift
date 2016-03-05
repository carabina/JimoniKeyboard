//
//  KeyboardViewController.swift
//  JimoniKeyboard
//
//  Created by Admin on 3/1/16.
//  Copyright (c) 2016 withalsolution. All rights reserved.
//

import UIKit
import MobileCoreServices
class ImageCollectionViewCell:UICollectionViewCell {
    @IBOutlet var imgView:UIImageView!
}

class KeyboardViewController: UIInputViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    var imgArray = NSMutableArray()
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
       // Add custom view sizing constraints here
        self.collectionView.registerNib(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        for(var i=1; i <= 30; i++)
        {
            self.imgArray.addObject("a\(i).png")
        }
        self.collectionView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Loading Xib
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as UIView;
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    //==================================================
    // Function Name: returnPressed
    // Function Parameter: button: UIButton
    // Function ReturnType: nil
    // Function Purpose: To return textfield
    //==================================================
    @IBAction func returnPressed(button: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    
    //==================================================
    // Function Name: nextKeyboardPressed
    // Function Parameter: button: UIButton
    // Function ReturnType: nil
    // Function Purpose: To change keyboard type
    //==================================================
    @IBAction func nextKeyboardPressed(button: UIButton) {
        advanceToNextInputMode()
    }
    
    
    //Collectionview delegate methods
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let iCell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCollectionViewCell", forIndexPath: indexPath) as ImageCollectionViewCell
        iCell.imgView.image = UIImage(named: self.imgArray.objectAtIndex(indexPath.row) as String)
        return iCell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imgArray.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let pb = UIPasteboard.generalPasteboard()
        let data = UIImagePNGRepresentation( UIImage(named: self.imgArray.objectAtIndex(indexPath.row) as String))
        pb.setData(data, forPasteboardType: kUTTypePNG as NSString)
        
        let iCell = self.collectionView.cellForItemAtIndexPath(indexPath) as ImageCollectionViewCell
        UIView.animateWithDuration(0.2, animations: {
            iCell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2.0, 2.0)
            }, completion: {(_) -> Void in
                iCell.transform =
                   CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
        })
        (textDocumentProxy as UIKeyInput).insertText("   ")
        
    }

}
