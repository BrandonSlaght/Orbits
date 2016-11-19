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
        
        if let let_description = planet.description {
            descriptionText.text = let_description
        }
        
        let touchWiki = UITapGestureRecognizer(target: self, action:#selector(self.openWiki))
        touchWiki.numberOfTapsRequired = 1
        wikiImage.isUserInteractionEnabled = true
        wikiImage.addGestureRecognizer(touchWiki)
        
        let touchNasa = UITapGestureRecognizer(target: self, action:#selector(self.openNASA))
        touchNasa.numberOfTapsRequired = 1
        nasaImage.isUserInteractionEnabled = true
        nasaImage.addGestureRecognizer(touchNasa)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func openWiki() {
        if let let_wiki = planet.wiki {
            UIApplication.shared.openURL(URL(string: let_wiki)!)
        }
    }
    
    func openNASA() {
        if let let_nasa = planet.nasa {
            UIApplication.shared.openURL(URL(string: let_nasa)!)
        }
    }
}
