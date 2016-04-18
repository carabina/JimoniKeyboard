# JimoniKeyboard
It is very handy custom keyboard for ios using extension

## Requirements

- iOS 8.0+

## Screenshot

![JiMoni] (https://github.com/withalsolution/JimoniKeyboard/blob/master/keyboard.png)

Its a custom emoji keyboard that directly allow to access emoji images from keyboard to app.


After tapping of any of emoji you can paste it on apps like email, messanges by directly paste from menu controller


## Usage

The following code copy data into pasteBoard
  ```swift
        let pb = UIPasteboard.generalPasteboard()
        let data = UIImagePNGRepresentation( UIImage(named: self.imgArray.objectAtIndex(indexPath.row) as String))
        pb.setData(data, forPasteboardType: kUTTypePNG as NSString)
  
  ```
        



and now you can paste this emoji image any app that support paste image functionality like whatsapp, facebook messager.

After running this you must need to add this emoji keyboard from simulator or device.
You can add this keyboard from
Settings -> 
               General ->
                              Keyboard -> 
                                         Keyboards ->
                                                   Add New Keyboard ->
                                                                             Jimoni - Emoji keyboard.

## Note

Before you use in real device you must need to full access to paste image from this keyboard you can give this permission from app settings or simply changing permission to `true` for Request `Open Access` from info.plist

                <dict>
			<key>IsASCIICapable</key>
			<false/>
			<key>PrefersRightToLeft</key>
			<false/>
			<key>PrimaryLanguage</key>
			<string>en-US</string>
			<key>RequestsOpenAccess</key>
			<true/>
		</dict>
