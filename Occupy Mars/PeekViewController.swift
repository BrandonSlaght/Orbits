//
//  PeekViewController.swift
//  Occupy Mars
//
//  Created by Brandon Slaght on 10/14/17.
//  Copyright © 2017 Slaght, Brandon. All rights reserved.
//

import Foundation

class PeekViewController: UIViewController {
    
    @IBOutlet weak var imageHolder: UIImageView!
    
    var imageObject = UIImage()
    
    //func PeekViewController() {}
    
    override func viewDidLoad() {
        imageHolder.image = imageObject
    }
}
