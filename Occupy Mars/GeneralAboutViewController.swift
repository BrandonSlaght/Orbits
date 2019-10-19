//
//  GeneralAboutViewController.swift
//  Occupy Mars
//
//  Created by Slaght, Brandon on 11/5/16.
//  Copyright © 2016 Slaght, Brandon. All rights reserved.
//

import UIKit

class GeneralAboutViewController: AboutViewController {
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var wikiImage: UIImageView!
    @IBOutlet weak var nasaImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let let_description = body.description {
            descriptionText.text = let_description
            //descriptionText.textContainerInset = UIEdgeInsets.zero
            //descriptionText.textContainer.lineFragmentPadding = 0
        }
        
        let touchWiki = UITapGestureRecognizer(target: self, action:#selector(self.openWiki))
        touchWiki.numberOfTapsRequired = 1
        //wikiImage.isUserInteractionEnabled = true
        wikiImage.addGestureRecognizer(touchWiki)
        
        let touchNasa = UITapGestureRecognizer(target: self, action:#selector(self.openNASA))
        touchNasa.numberOfTapsRequired = 1
        //nasaImage.isUserInteractionEnabled = true
        nasaImage.addGestureRecognizer(touchNasa)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func openWiki() {
        if let let_wiki = body.wiki {
            UIApplication.shared.open(URL(string: let_wiki)!, options: [:])
        }
    }
    
    @objc func openNASA() {
        if let let_nasa = body.nasa {
            UIApplication.shared.open(URL(string: let_nasa)!, options: [:])
        }
    }
}
