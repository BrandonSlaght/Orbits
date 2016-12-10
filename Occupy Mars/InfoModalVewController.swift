//
//  InfoModalVewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/19/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//
import UIKit

class InfoModalViewController: UIViewController {
    
    @IBOutlet weak var gitImage: UIImageView!
    @IBOutlet weak var webImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
        
        let touchGit = UITapGestureRecognizer(target: self, action:#selector(self.openGit))
        touchGit.numberOfTapsRequired = 1
        gitImage.isUserInteractionEnabled = true
        gitImage.addGestureRecognizer(touchGit)
        
        let touchWeb = UITapGestureRecognizer(target: self, action:#selector(self.openWeb))
        touchWeb.numberOfTapsRequired = 1
        webImage.isUserInteractionEnabled = true
        webImage.addGestureRecognizer(touchWeb)
        
//        textView.isUserInteractionEnabled = true
//        textView.dataDetectorTypes = UIDataDetectorTypes.link
//        textView.isScrollEnabled = false
//        textView.isEditable = false
//        textView.isSelectable = true
        
        let string = "Planet reference data:\nNASA\n\nPlanet texture maps\nSteve Albers\nBjörn Jónsson\nJames Hastings-Trew\nAnd probably others\n\nOrbital calculations:\nPaul Schlyter\n\nImages and other media:\nNASA\nESA\n\n\n\nIf I forgot to list you as a source of media (I used a lot of it), let me know and I will credit you!"
        let linkString = NSMutableAttributedString(string: string)
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "https://www.nasa.gov")!, range: NSMakeRange(23, 4))
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://www.stevealbers.net/albers/sos/sos.html")!, range: NSMakeRange(49, 12))
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://bjj.mmedia.is/data/planetary_maps.html")!, range: NSMakeRange(62, 13))
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://planetpixelemporium.com/planets.html")!, range: NSMakeRange(76, 19))
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://www.stjarnhimlen.se/comp/ppcomp.html")!, range: NSMakeRange(139, 13))
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "https://www.nasa.gov")!, range: NSMakeRange(178, 4))
        linkString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://www.esa.int/ESA")!, range: NSMakeRange(183, 3))
        textView.attributedText = linkString
        textView.textColor = UIColor.white
        textView.textAlignment = .center
    }
    
    func openGit() {
        UIApplication.shared.openURL(URL(string: "http://www.github.com/BrandonSlaght")!)
    }
    
    func openWeb() {
        UIApplication.shared.openURL(URL(string: "http://www.brandonslaght.me")!)
    }
}
