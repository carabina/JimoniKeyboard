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
    
    /*=================================================
    * Function Name: addNavigationRightButton
    * Function Parameter:
    * Function Return Type: UIImage
    * Function Purpose: To add share button as navigation rightbar
    ==================================================*/
    func addNavigationRightButton()
    {
        let button = UIButton(frame: CGRectMake(0,0,20,25))
        button.setImage(UIImage(named: "share"), forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("shareMenu:"), forControlEvents: .TouchUpInside)
        let rightItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightItem
    }
//Paste from System UIMenuController
    override func paste(sender: AnyObject!) {
        
        let pasteBoard = UIPasteboard.generalPasteboard()
        
        
        if let _ = pasteBoard.pasteboardTypes() as? [String]
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
          if let data = pasteBoard.dataForPasteboardType(kUTTypePNG as NSString as String)
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
            
                if let data = pasteBoard.dataForPasteboardType(kUTTypeJPEG as NSString as String)
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
        
        
        let attributedString = NSMutableAttributedString(string: "")
        if let data = pasteBoard.dataForPasteboardType(kUTTypePNG as NSString as String)
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
    
   

/*=================================================
* Function Name: shareMenu
* Function Parameter: sender:UIButton
* Function Return Type:
* Function Purpose: To open share menu
==================================================*/
    @IBAction func shareMenu(sender: AnyObject) {
        let myApp = NSURL(string:"https://play.google.com/apps/publish/?dev_acc=03575560666186575401#ContentRatingPlace:p=withalsolution.helptoworld")
        let img: UIImage = self.getImage()
        
        
        let shareItems = NSArray(objects:[img, myApp!])
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems as [AnyObject], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypePostToWeibo, UIActivityTypeCopyToPasteboard, UIActivityTypeAddToReadingList, UIActivityTypePostToVimeo]
        self.presentViewController(activityViewController, animated: true, completion: nil)

    }

    
/*=================================================
* Function Name: getImage
* Function Parameter:
* Function Return Type: UIImage
* Function Purpose: To take screenshot of textview
==================================================*/
func getImage() -> UIImage
{
    UIGraphicsBeginImageContext(self.txtView.frame.size)
    self.txtView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
    
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

