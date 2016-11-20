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
        
    }
    
    func openGit() {
        UIApplication.shared.openURL(URL(string: "http://www.github.com/BrandonSlaght")!)
    }
    
    func openWeb() {
        UIApplication.shared.openURL(URL(string: "http://www.brandonslaght.me")!)
    }
}
