//
//  ViewController.swift
//  Jimoni
//
//  Created by Admin on 3/1/16.
//  Copyright (c) 2016 withalsolution. All rights reserved.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var txtView:UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
//Paste from System UIMenuController
    override func paste(sender: AnyObject!) {
        
        let pasteBoard = UIPasteboard.generalPasteboard()
        
        
        if let _ = pasteBoard.pasteboardTypes()
        {

        }
        else
        {
            return
        }

            let itemTypeArray = pasteBoard.pasteboardTypes() as NSArray
          var attributedString = NSMutableAttributedString(string: "")
        if (itemTypeArray.containsObject(kUTTypePNG as NSString))
        {
          if let data = pasteBoard.dataForPasteboardType(kUTTypePNG as NSString)
          {
            let textAttachment = NSTextAttachment()
            textAttachment.image = UIImage(data: data)
            textAttachment.image = UIImage(CGImage: textAttachment.image!.CGImage!, scale: 3, orientation: .Up)
            let attrStringWithImage = NSAttributedString(attachment: textAttachment)
            attributedString.appendAttributedString(attrStringWithImage);
            let mutableString = NSMutableAttributedString(attributedString: self.txtView.attributedText)
            mutableString.appendAttributedString(attributedString)
            self.txtView.attributedText = mutableString;

            
            }
        }
        else if (itemTypeArray.containsObject(kUTTypeJPEG as NSString))
        {
            
                if let data = pasteBoard.dataForPasteboardType(kUTTypeJPEG as NSString)
                {
                    let textAttachment = NSTextAttachment()
                    textAttachment.image = UIImage(data: data)
                    textAttachment.image = UIImage(CGImage: textAttachment.image!.CGImage!, scale: 3, orientation: .Up)
                    let attrStringWithImage = NSAttributedString(attachment: textAttachment)
                    attributedString.appendAttributedString(attrStringWithImage);
                    let mutableString = NSMutableAttributedString(attributedString: self.txtView.attributedText)
                    mutableString.appendAttributedString(attributedString)
                    self.txtView.attributedText = mutableString;
                    
                    
                }
            
        }
        else
        {
            if let img = pasteBoard.image
            {
                    let textAttachment = NSTextAttachment()
                    textAttachment.image = img
                    textAttachment.image = UIImage(CGImage: textAttachment.image!.CGImage!, scale: 3, orientation: .Up)
                    let attrStringWithImage = NSAttributedString(attachment: textAttachment)
                    attributedString.appendAttributedString(attrStringWithImage);
                    let mutableString = NSMutableAttributedString(attributedString: self.txtView.attributedText)
                    mutableString.appendAttributedString(attributedString)
                    self.txtView.attributedText = mutableString;
            }
        }
    }
    
//==================================================
// Function Name: pasteJMoniImage
// Function Parameter: nil
// Function ReturnType: nil
// Function Purpose: To paste image in textview
//==================================================
    func pasteJMoniImage()
    {
        let pasteBoard = UIPasteboard.generalPasteboard()
        let itemTypeArray = pasteBoard.pasteboardTypes() as NSArray
        
        var attributedString = NSMutableAttributedString(string: "")
        if let data = pasteBoard.dataForPasteboardType(kUTTypePNG as NSString)
        {
            let textAttachment = NSTextAttachment()
            textAttachment.image = UIImage(data: data)
            textAttachment.image = UIImage(CGImage: textAttachment.image!.CGImage!, scale: 3, orientation: .Up)
            let attrStringWithImage = NSAttributedString(attachment: textAttachment)
            attributedString.appendAttributedString(attrStringWithImage);
            let mutableString = NSMutableAttributedString(attributedString: self.txtView.attributedText)
            mutableString.appendAttributedString(attributedString)
            self.txtView.attributedText = mutableString;
        }
    }
    
    //textview delegate methods
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "   ")
        {
                self.pasteJMoniImage()
                return false
        }
        if(text == "\n")
        {
            self.txtView.resignFirstResponder()
            return false
        }
        return true
    }
    
}

